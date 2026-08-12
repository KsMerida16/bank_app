import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/features/notifications/presentation/widgets/notifications_item.dart';
import 'package:bank_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bank_app/features/notifications/presentation/state/notifications_notifier.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsNotifierProvider);

    final unreadCount = notifications
        .where((notification) => !notification.isRead)
        .length;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notificaciones',
        onPressed: () {
          context.goNamed(Routes.dashboard);
        },
      ),
      body: notifications.isEmpty
          ? const _EmptyNotifications()
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Text(
                      'Notificaciones',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    if (unreadCount > 0)
                      TextButton(
                        onPressed: () {
                          ref
                              .read(notificationsNotifierProvider.notifier)
                              .markAllAsRead();
                        },
                        child: const Text('Marcar todas'),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                ...notifications.map(
                  (notification) => NotificationItem(
                    notification: notification,
                    onTap: () {
                      ref
                          .read(notificationsNotifierProvider.notifier)
                          .markAsRead(notification.id);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'No tienes notificaciones',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aquí aparecerán las notificaciones importantes de tu cuenta.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
