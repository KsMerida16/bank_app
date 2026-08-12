// lib/presentation/screens/home_dashboard_page.dart
import 'dart:ui' as ui show FontFeature;
import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_notifier.dart';
import 'package:bank_app/features/dashboard/presentation/state/sign_out_notifier.dart';
import 'package:bank_app/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bank_app/theme/app_colors.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:go_router/go_router.dart';

class HomeDashboardPage extends ConsumerStatefulWidget {
  const HomeDashboardPage({
    super.key,
    this.userName,
    this.userGender,
    this.userImage,
  });

  final String? userName;
  final String? userGender;
  final String? userImage;

  @override
  ConsumerState<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends ConsumerState<HomeDashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = _resolveDashboardUserId();
      if (userId == null || userId.isEmpty) return;
      ref.read(dashboardNotifierProvider.notifier).loadDashboard(userId);
    });
  }

  String? _resolveDashboardUserId() {
    final firebaseUser = firebase_auth.FirebaseAuth.instance.currentUser;
    // final uid = firebaseUser?.uid.trim();
    // if (uid != null && uid.isNotEmpty) return uid;

    final email = firebaseUser?.email?.trim();
    if (email != null && email.isNotEmpty) return email;

    final fromWidget = widget.userName?.trim();
    if (fromWidget != null && fromWidget.isNotEmpty) return fromWidget;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardNotifierProvider);
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;
    final bottom = MediaQuery.of(context).padding.bottom;

    final loadedData = dashboardState.maybeWhen(
      loaded:
          (
            user,
            accounts,
            cards,
            movements,
            hasMoreMovements,
            isLoadingMoreMovements,
            lastMovementTimestamp,
          ) => (
            user: user,
            accounts: accounts,
            cards: cards,
            movements: movements,
            hasMoreMovements: hasMoreMovements,
            isLoadingMoreMovements: isLoadingMoreMovements,
          ),
      orElse: () => null,
    );

    final currentUser = loadedData?.user.fullName.trim().isNotEmpty == true
        ? loadedData!.user.fullName
        : widget.userName?.trim().isNotEmpty == true
        ? widget.userName!
        : 'Usuario';

    final gender = loadedData?.user.gender ?? widget.userGender;
    final isMale = (gender ?? '').toLowerCase() == 'male';
    final userImage = loadedData?.user.image?.isNotEmpty == true
        ? loadedData!.user.image
        : widget.userImage?.isNotEmpty == true
        ? widget.userImage
        : null;

    final isLoading = dashboardState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final errorMessage = dashboardState.maybeWhen(
      error: (message) => message,
      orElse: () => null,
    );

    final movements = loadedData?.movements ?? <Movement>[];
    final accounts = loadedData?.accounts ?? <Account>[];
    final cards = loadedData?.cards ?? <CardModel>[];
    final hasMoreMovements = loadedData?.hasMoreMovements ?? false;
    final isLoadingMoreMovements = loadedData?.isLoadingMoreMovements ?? false;

    return Scaffold(
      backgroundColor: c.background,
      appBar: AppBar(
        backgroundColor: c.background,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 18,
              backgroundColor: c.divider,
              backgroundImage: userImage != null && userImage.isNotEmpty
                  ? NetworkImage(userImage)
                  : null,
              child: userImage == null || userImage.isEmpty
                  ? const Icon(Icons.person, size: 20)
                  : null,
            ),
            const SizedBox(width: 12),
            // Bienvenida
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isMale
                        ? t.welcomeUserMale(currentUser)
                        : t.welcomeUserFemale(currentUser),
                    style: TextStyle(color: c.textSecondary, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currentUser,
                    style: TextStyle(
                      color: c.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _RoundIconButton(
              icon: Icons.notifications_none_rounded,
              bg: _blend(c.surface, Colors.white.withValues(alpha: 0.04)),
              fg: c.textPrimary,
              onTap: () {
                context.goNamed(Routes.notifications);
              },
            ),

            const SizedBox(width: 8),
            // Botón de cierre de sesión
            _RoundIconButton(
              icon: Icons.logout,
              bg: _blend(c.surface, Colors.white.withValues(alpha: 0.04)),
              fg: c.textPrimary,
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: Text(t.logout),
                      content: Text(t.sure),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: Text(t.cancel),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: Text(t.exit),
                        ),
                      ],
                    );
                  },
                );

                if (confirm != true) return;
                if (!mounted) return;

                final success = await ref
                    .read(signOutRiverpodProvider.notifier)
                    .signOut();

                if (!mounted) return;

                if (success) {
                  ref.read(signInRiverpodProvider.notifier).signOut();
                  // ignore: use_build_context_synchronously
                  final currentContext = context;
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(
                    // ignore: use_build_context_synchronously
                    currentContext,
                  ).showSnackBar(SnackBar(content: Text(t.closed)));
                  // ignore: use_build_context_synchronously
                  currentContext.go(Routes.startLocation);
                } else if (mounted) {
                  // ignore: use_build_context_synchronously
                  final currentContext = context;
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(currentContext).showSnackBar(
                    SnackBar(
                      content: Text(t.logout),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: c.primary))
            : errorMessage != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: c.textSecondary),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {
                          final userId = _resolveDashboardUserId();
                          if (userId == null || userId.isEmpty) return;
                          ref
                              .read(dashboardNotifierProvider.notifier)
                              .loadDashboard(userId);
                        },
                        child: Text(t.tryAgain),
                      ),
                    ],
                  ),
                ),
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (!hasMoreMovements || isLoadingMoreMovements) {
                    return false;
                  }

                  final shouldLoadMore =
                      notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent - 180;

                  if (shouldLoadMore) {
                    ref
                        .read(dashboardNotifierProvider.notifier)
                        .loadMoreMovements();
                  }

                  return false;
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tarjeta principal
                      _CardsCarousel(
                        c: c,
                        userName: currentUser,
                        accounts: accounts,
                        cards: cards,
                      ),
                      const SizedBox(height: 20),

                      // Acciones rápidas
                      _QuickActionsRow(c: c),
                      const SizedBox(height: 24),

                      // Encabezado de sección
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              t.transactions,
                              style: TextStyle(
                                color: c.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              t.seeAll,
                              style: TextStyle(
                                color: c.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      if (movements.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            t.noResults,
                            style: TextStyle(color: c.textSecondary),
                          ),
                        )
                      else
                        ...movements.map((movement) {
                          final isNegative =
                              movement.sign.trim().startsWith('-') ||
                              movement.amount < 0;
                          final amountValue = movement.amount
                              .abs()
                              .toStringAsFixed(2);
                          final amountText = isNegative
                              ? '- \$ $amountValue'
                              : '\$ $amountValue';

                          return Column(
                            children: [
                              _TransactionTile(
                                c: c,
                                leading: _CircleBrand(
                                  c: c,
                                  child: Icon(
                                    _iconForCategory(movement.category),
                                    size: 18,
                                  ),
                                ),
                                title: movement.description,
                                subtitle: movement.category,
                                amountText: amountText,
                                amountColor: isNegative
                                    ? c.textPrimary
                                    : c.primary,
                              ),
                              _DividerLine(c: c),
                            ],
                          );
                        }),

                      if (isLoadingMoreMovements)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: c.primary,
                              ),
                            ),
                          ),
                        ),

                      SizedBox(
                        height: kBottomNavigationBarHeight + 16 + bottom,
                      ),
                    ],
                  ),
                ),
              ),
      ),

      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }

  IconData _iconForCategory(String category) {
    final normalized = category.toLowerCase();
    if (normalized.contains('music')) return Icons.music_note_rounded;
    if (normalized.contains('entertainment')) return CupertinoIcons.ant_circle;
    if (normalized.contains('grocery')) return Icons.shopping_bag_outlined;
    if (normalized.contains('transfer') || normalized.contains('transaction')) {
      return Icons.sync_alt_rounded;
    }
    return Icons.receipt_long_outlined;
  }
}

// =============== Sección: widgets internos de la pantalla ===============

class _CreditCard extends StatelessWidget {
  const _CreditCard({
    required this.c,
    required this.userName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.productLabel,
  });

  final AppColors c;
  final String userName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String productLabel;

  @override
  Widget build(BuildContext context) {
    final surface = _blend(c.surface, Colors.white.withValues(alpha: 0.02));
    final t = AppLocalizations.of(context)!;
    final grad = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        _blend(c.primary, surface).withValues(alpha: 0.65),
        c.primary.withValues(alpha: 0.85),
      ],
    );

    return Container(
      height: 190,
      decoration: BoxDecoration(
        gradient: grad,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          // Círculos decorativos
          Positioned(
            right: -40,
            bottom: -30,
            child: _CircleBlob(
              diameter: 160,
              color: Colors.black.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -20,
            child: _CircleBlob(
              diameter: 120,
              color: Colors.black.withValues(alpha: 0.12),
            ),
          ),

          // Contenido de la tarjeta
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila superior: chip + marca
                Row(
                  children: [
                    _CardChip(c: c),
                    const Spacer(),
                    _MastercardMark(),
                  ],
                ),
                const Spacer(),
                // Número principal
                Text(
                  _formattedCardNumber(cardNumber),
                  style: TextStyle(
                    color: c.onPrimary,
                    fontFeatures: const [ui.FontFeature.tabularFigures()],
                    fontSize: 22,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                // Detalles inferiores
                Row(
                  children: [
                    _MiniField(
                      label: userName,
                      value: '',
                      color: c.onPrimary.withValues(alpha: 0.95),
                      labelStyle: TextStyle(
                        color: c.onPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    _MiniField(
                      label: t.expiryDate, //'Expiry Date',
                      value: expiryDate,
                      color: c.onPrimary,
                    ),
                    const SizedBox(width: 16),
                    _MiniField(label: 'CVV', value: cvv, color: c.onPrimary),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  productLabel.toUpperCase(),
                  style: TextStyle(
                    color: c.onPrimary.withValues(alpha: 0.85),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formattedCardNumber(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 16) return value;
    final chunks = <String>[];
    for (var i = 0; i < digits.length; i += 4) {
      chunks.add(digits.substring(i, i + 4));
    }
    return chunks.join('  ');
  }
}

class _CardsCarousel extends StatefulWidget {
  const _CardsCarousel({
    required this.c,
    required this.userName,
    required this.accounts,
    required this.cards,
  });

  final AppColors c;
  final String userName;
  final List<Account> accounts;
  final List<CardModel> cards;

  @override
  State<_CardsCarousel> createState() => _CardsCarouselState();
}

class _CardsCarouselState extends State<_CardsCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.92);
  int _currentIndex = 0;

  List<_CarouselProduct> get _items {
    final items = <_CarouselProduct>[];

    for (final card in widget.cards) {
      items.add(_CarouselProduct.card(card: card));
    }

    for (final account in widget.accounts) {
      items.add(_CarouselProduct.account(account));
    }

    return items;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;

    if (items.isEmpty) {
      return _CreditCard(
        c: widget.c,
        userName: widget.userName,
        cardNumber: '0000 0000 0000 0000',
        expiryDate: '--/--',
        cvv: '---',
        productLabel: 'Sin productos',
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _controller,
            itemCount: items.length,
            onPageChanged: (index) {
              if (_currentIndex == index) return;
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = items[index];
              final isActive = index == _currentIndex;

              return AnimatedScale(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                scale: isActive ? 1 : 0.94,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: item.when(
                    card: (card) => _CreditCard(
                      c: widget.c,
                      userName: card.cardHolderName.isNotEmpty
                          ? card.cardHolderName
                          : widget.userName,
                      cardNumber: card.cardNumber,
                      expiryDate: card.expirationDate,
                      cvv: card.cvv,
                      productLabel: 'Tarjeta',
                    ),
                    account: (account) => _AccountSummaryCard(
                      c: widget.c,
                      userName: widget.userName,
                      account: account,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (index) {
            final isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? widget.c.primary
                    : widget.c.textMuted.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(999),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _AccountSummaryCard extends StatelessWidget {
  const _AccountSummaryCard({
    required this.c,
    required this.userName,
    required this.account,
  });

  final AppColors c;
  final String userName;
  final Account account;

  @override
  Widget build(BuildContext context) {
    final surface = _blend(c.surface, Colors.white.withValues(alpha: 0.02));
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        _blend(c.surface, c.primary.withValues(alpha: 0.38)),
        _blend(c.primary, surface).withValues(alpha: 0.92),
      ],
    );

    return Container(
      height: 190,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Cuenta',
                    style: TextStyle(
                      color: c.onPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.account_balance_rounded,
                  color: c.onPrimary.withValues(alpha: 0.92),
                ),
              ],
            ),
            const Spacer(),
            Text(
              account.accountType.toUpperCase(),
              style: TextStyle(
                color: c.onPrimary.withValues(alpha: 0.82),
                fontSize: 11,
                letterSpacing: 0.9,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '\$ ${account.accountBalance.toStringAsFixed(2)}',
              style: TextStyle(
                color: c.onPrimary,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _formatAccountNumber(account.accountNumber),
              style: TextStyle(
                color: c.onPrimary,
                fontFeatures: const [ui.FontFeature.tabularFigures()],
                fontSize: 17,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: c.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'Titular',
                        style: TextStyle(
                          color: c.onPrimary.withValues(alpha: 0.78),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Producto',
                        style: TextStyle(
                          color: c.onPrimary.withValues(alpha: 0.78),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        account.accountType,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: c.onPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatAccountNumber(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) return value;
    final visible = digits.substring(digits.length - 10);
    return '${visible.substring(0, 4)} ${visible.substring(4)}';
  }
}

sealed class _CarouselProduct {
  const _CarouselProduct();

  const factory _CarouselProduct.card({required CardModel card}) =
      _CarouselCardProduct;

  const factory _CarouselProduct.account(Account account) =
      _CarouselAccountProduct;

  T when<T>({
    required T Function(CardModel card) card,
    required T Function(Account account) account,
  }) {
    final product = this;
    if (product is _CarouselCardProduct) {
      return card(product.card);
    }
    if (product is _CarouselAccountProduct) {
      return account(product.account);
    }
    throw StateError('Unknown carousel product type');
  }
}

class _CarouselCardProduct extends _CarouselProduct {
  const _CarouselCardProduct({required this.card});

  final CardModel card;
}

class _CarouselAccountProduct extends _CarouselProduct {
  const _CarouselAccountProduct(this.account);

  final Account account;
}

// ignore: unused_element
class _Account extends StatelessWidget {
  const _Account({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context) {
    final surface = _blend(c.surface, Colors.white.withValues(alpha: 0.02));
    // ignore: unused_local_variable
    final t = AppLocalizations.of(context)!;
    final grad = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        _blend(c.primary, surface).withValues(alpha: 0.65),
        c.primary.withValues(alpha: 0.85),
      ],
    );

    return Container(
      height: 190,
      decoration: BoxDecoration(
        gradient: grad,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          // Círculos decorativos
          // Positioned(
          //   right: -40,
          //   bottom: -30,
          //   child: _CircleBlob(
          //     diameter: 160,
          //     color: Colors.black.withValues(alpha: 0.15),
          //   ),
          // ),
          // Positioned(
          //   right: 40,
          //   bottom: -20,
          //   child: _CircleBlob(
          //     diameter: 120,
          //     color: Colors.black.withValues(alpha: 0.12),
          //   ),
          // ),

          // Contenido de la tarjeta
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila superior: chip + marca
                Row(
                  children: [
                    //_CardChip(c: c),
                    const Spacer(),
                    //_MastercardMark(),
                    _MoneyMark(),
                  ],
                ),
                //const Spacer(),
                // Número principal
                Text(
                  '3510597895',
                  style: TextStyle(
                    color: c.onPrimary,
                    fontFeatures: const [ui.FontFeature.tabularFigures()],
                    fontSize: 22,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                // Detalles inferiores
                Row(
                  children: [
                    _MiniField(
                      label: 'David Guerra',
                      value: '',
                      color: c.onPrimary.withValues(alpha: 0.95),
                      labelStyle: TextStyle(
                        color: c.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardChip extends StatelessWidget {
  const _CardChip({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 26,
      decoration: BoxDecoration(
        color: _blend(c.onPrimary, Colors.black.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Container(
          width: 18,
          height: 12,
          decoration: BoxDecoration(
            color: c.onPrimary.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

class _MastercardMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Marca simple con dos círculos intersectados
    return const SizedBox(
      width: 56,
      height: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 10, child: _Dot(color: Color(0xFFFF5F5A))),
          Positioned(right: 10, child: _Dot(color: Color(0xFFFFB84D))),
        ],
      ),
    );
  }
}

class _MoneyMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Marca simple con dos círculos intersectados
    return const SizedBox(
      width: 56,
      height: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 0, child: _Dot(color: Colors.orange)),
          Positioned(right: 5, child: _Dot(color: Colors.orange)),
        ],
      ),
    );
  }
}

class _MiniField extends StatelessWidget {
  const _MiniField({
    required this.label,
    required this.value,
    required this.color,
    this.labelStyle,
  });

  final String label;
  final String value;
  final Color color;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final defaultLabelStyle = TextStyle(
      color: color.withValues(alpha: 0.9),
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle ?? defaultLabelStyle),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _CircleBlob extends StatelessWidget {
  const _CircleBlob({required this.diameter, required this.color});

  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _QuickActionsRow extends ConsumerWidget {
  const _QuickActionsRow({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _QuickAction(
          icon: Icons.north_east,
          label: t.sent,
          onTap: () => context.goNamed(Routes.transfer),
        ), //),
        _QuickAction(icon: Icons.south_west, label: t.receive), //'Receive'),
        _QuickAction(
          icon: Icons.account_balance_wallet_outlined,
          label: t.loan, //'Loan',
        ),
        _QuickAction(
          icon: Icons.refresh_outlined,
          label: t.refresh, //'Refresh',
          onTap: () =>
              ref.read(dashboardNotifierProvider.notifier).refreshDashboard(),
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final bg = _blend(c.surface, Colors.white.withValues(alpha: 0.03));

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: c.shadow ?? Colors.black.withValues(alpha: 0.18),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: c.textPrimary),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: c.textSecondary, fontSize: 12)),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.c,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.amountText,
    required this.amountColor,
  });

  final AppColors c;
  final Widget leading;
  final String title;
  final String subtitle;
  final String amountText;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: c.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: c.textSecondary, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            amountText,
            style: TextStyle(color: amountColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _CircleBrand extends StatelessWidget {
  const _CircleBrand({required this.c, required this.child});
  final AppColors c;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bg = _blend(c.surface, Colors.white.withValues(alpha: 0.03));
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Center(
        child: IconTheme(
          data: IconThemeData(color: c.textPrimary),
          child: child,
        ),
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: 1, color: c.divider);
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.bg,
    required this.fg,
    this.onTap,
  });

  final IconData icon;
  final Color bg;
  final Color fg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 20, color: fg),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _BottomNavMock extends StatelessWidget {
  const _BottomNavMock({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: _blend(c.surface, Colors.black.withValues(alpha: 0.15)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: c.primary,
        unselectedItemColor: c.textMuted,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: t.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card_rounded),
            label: t.myCards,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart_rounded),
            label: t.statistics,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_rounded),
            label: t.settings,
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          if (index == 0) return;

          switch (index) {
            case 3:
              context.goNamed(Routes.settings);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

// Utilidad para mezclar colores con el surface actual (suaviza fondos).
Color _blend(Color base, Color overlay) => Color.alphaBlend(overlay, base);

class CarruselEnfocado extends StatefulWidget {
  const CarruselEnfocado({super.key});

  @override
  State<CarruselEnfocado> createState() => _CarruselEnfocadoState();
}

class _CarruselEnfocadoState extends State<CarruselEnfocado> {
  final _controller = PageController(viewportFraction: 0.75);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    return SizedBox(
      height: 240,
      child: PageView.builder(
        controller: _controller,
        itemCount: 6,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = 1.0;
              if (_controller.position.haveDimensions) {
                value =
                    (_controller.page ?? _controller.initialPage.toDouble()) -
                    index;
                value = (1 - (value.abs() * 0.2)).clamp(0.9, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        color: c.onPrimary,
                        //Colors.primaries[index % Colors.primaries.length],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
