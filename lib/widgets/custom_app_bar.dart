import 'package:flutter/material.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: c.background,
      elevation: 0,
      centerTitle: true,

      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        tooltip: t.back,
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(t.noBackPage)),
            );
          }
        },
      ),

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
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(t.exit),
                    ),
                  ],
                );
              },
            );

            if (confirm == true && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.closed)),
              );
            }
          },
        ),
        const SizedBox(width: 8),
      ],

      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}