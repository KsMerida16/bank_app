import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/features/dashboard/presentation/state/sign_out_notifier.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.onPressed,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: c.background,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: onPressed != null || context.canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              tooltip: t.back,
              onPressed:
                  onPressed ??
                  () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.goNamed(Routes.dashboard);
                    }
                  },
            )
          : null,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          tooltip: t.logout,
          onPressed: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(t.logout),
                  content: Text(t.sure),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: Text(t.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () => context.pop(true),
                      child: Text(t.exit),
                    ),
                  ],
                );
              },
            );

            if (confirm == true && context.mounted) {
              final success = await ref
                  .read(signOutRiverpodProvider.notifier)
                  .signOut();

              if (success && context.mounted) {
                ref.read(signInRiverpodProvider.notifier).signOut();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.closed)));
                context.go(Routes.startLocation);
              } else if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.logout),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
