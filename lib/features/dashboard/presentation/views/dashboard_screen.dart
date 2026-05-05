// lib/presentation/screens/home_dashboard_page.dart
import 'dart:ui' as ui show FontFeature;
import 'package:bank_app/features/settings/presentation/settings_page.dart';
import 'package:bank_app/features/transfers/presentation/transfer_page.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/theme/app_colors.dart';
import 'package:bank_app/theme/colors_scope.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key, this.userName, this.userGender, this.userImage});

  final String? userName;
  final String? userGender;
  final String? userImage;

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;
    final bottom = MediaQuery.of(context).padding.bottom;
    // ignore: unused_local_variable
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final currentUser = widget.userName?.trim().isNotEmpty == true ? widget.userName! : 'Usuario';
    final isMale = widget.userGender?.toLowerCase() == 'male';
    final userImage = widget.userImage?.isNotEmpty == true ? widget.userImage : null;

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
                    isMale ? t.welcomeUserMale : t.welcomeUserFemale,
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
            // Botón de búsqueda
            _RoundIconButton(
              icon: Icons.search,
              bg: _blend(c.surface, Colors.white.withValues(alpha: 0.04)),
              fg: c.textPrimary,
              onTap: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tarjeta principal
              _CreditCard(c: c, userName: currentUser),
              //_Account(c: c),
              //const CarruselEnfocado(),
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
                      //'See All',
                      style: TextStyle(
                        color: c.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Lista de transacciones (mock)

              // Apple
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(CupertinoIcons.ant_circle, size: 18),
                ),
                title: 'Apple',
                subtitle: t.entertainment,
                amountText: '- \$ 5,99',
                amountColor: c.textPrimary,
              ),
              _DividerLine(c: c),

              // Spotify
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(Icons.music_note_rounded, size: 18),
                ),
                title: 'Spotify',
                subtitle: t.music,
                amountText: '- \$ 12,99',
                amountColor: c.textPrimary,
              ),
              _DividerLine(c: c),

              //Money transfer 300
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(Icons.sync_alt_rounded, size: 18),
                ),
                title: 'Money Transfer',
                subtitle: t.transaction,
                amountText: '\$300',
                amountColor: c.primary, // positivo resaltado en primario
              ),
              _DividerLine(c: c),

              //Money transfer 500
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(Icons.sync_alt_rounded, size: 18),
                ),
                title: 'Money Transfer',
                subtitle: t.transaction,
                amountText: '\$500',
                amountColor: c.primary, // positivo resaltado en primario
              ),
              _DividerLine(c: c),

              // Grocery
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(Icons.shopping_bag_outlined, size: 18),
                ),
                title: 'Walmart',
                subtitle: t.grocery,
                amountText: '- \$ 88',
                amountColor: c.textPrimary,
              ),
              _DividerLine(c: c),

              //Money transfer 200
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(Icons.sync_alt_rounded, size: 18),
                ),
                title: 'Money Transfer',
                subtitle: t.transaction,
                amountText: '\$200',
                amountColor: c.primary, // positivo resaltado en primario
              ),
              _DividerLine(c: c),

              // Apple
              _TransactionTile(
                c: c,
                leading: _CircleBrand(
                  c: c,
                  child: const Icon(CupertinoIcons.ant_circle, size: 18),
                ),
                title: 'Apple',
                subtitle: t.entertainment,
                amountText: '- \$ 5,99',
                amountColor: c.textPrimary,
              ),
              _DividerLine(c: c),

              SizedBox(height: kBottomNavigationBarHeight + 16 + bottom),
              //const SizedBox(height: 20), // espacio para el bottom bar
            ],
          ),
        ),
      ),

      // Bottom navigation (mock visual)
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(bottom: bottomSafe),
      //   child: _BottomNavMock(c: c),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: c.primary,
        unselectedItemColor: c.textMuted,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeDashboardPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: t.home, //  "Home",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card_outlined),
            label: t.myCards,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.pie_chart_outline),
            label: t.statistics, //"Statistics",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: t.settings, //"Settings",
          ),
        ],
      ),
    );
  }
}

// =============== Sección: widgets internos de la pantalla ===============

class _CreditCard extends StatelessWidget {
  const _CreditCard({required this.c, required this.userName});
  final AppColors c;
  final String userName;

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
                  '4562  1122  4595  7852',
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
                      value: '24/2000',
                      color: c.onPrimary,
                    ),
                    const SizedBox(width: 16),
                    _MiniField(label: 'CVV', value: '6986', color: c.onPrimary),
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

class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow({required this.c});
  final AppColors c;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _QuickAction(
          icon: Icons.north_east,
          label: t.sent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransferPage()),
            );
          },
        ), //),
        _QuickAction(icon: Icons.south_west, label: t.receive), //'Receive'),
        _QuickAction(
          icon: Icons.account_balance_wallet_outlined,
          label: t.loan, //'Loan',
        ),
        _QuickAction(icon: Icons.add, label: t.topup),
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
          // Home
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeDashboardPage(),
              ),
            );
          }

          // // Cards
          // if (index == 1) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const SettingsPage()),
          //   );
          // }

          // Statistics
          // if (index == 2) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const SettingsPage()),
          //   );
          // }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
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
