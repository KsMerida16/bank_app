import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bank_app/features/notifications/domain/entities/app_notification.dart';

final notificationsNotifierProvider =
    NotifierProvider<NotificationsNotifier, List<AppNotification>>(
      NotificationsNotifier.new,
    );

class NotificationsNotifier extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() {
    return [
      AppNotification(
        id: 'demo-1',
        title: 'Transferencia recibida',
        message: 'Has recibido Q500.00 en tu cuenta.',
        receivedAt: DateTime(2026, 8, 12, 9, 50),
        type: NotificationType.transfer,
      ),
      AppNotification(
        id: 'demo-2',
        title: 'Transferencia realizada',
        message: 'Tu transferencia de Q250.00 fue procesada correctamente.',
        receivedAt: DateTime(2026, 8, 12, 8, 30),
        type: NotificationType.transfer,
        isRead: true,
      ),
      AppNotification(
        id: 'demo-3',
        title: 'Pago realizado',
        message: 'El pago de Q125.00 fue realizado exitosamente.',
        receivedAt: DateTime(2026, 8, 11, 16, 00),
        type: NotificationType.payment,
        isRead: true,
      ),
      AppNotification(
        id: 'demo-4',
        title: 'Seguridad',
        message: 'Se detectó un nuevo inicio de sesión en tu cuenta.',
        receivedAt: DateTime(2026, 8, 11, 10, 30),
        type: NotificationType.security,
        isRead: true,
      ),
    ];
  }

  void addNotification(AppNotification notification) {
    state = [notification, ...state];
  }

  void markAsRead(String notificationId) {
    state = [
      for (final notification in state)
        if (notification.id == notificationId)
          notification.copyWith(isRead: true)
        else
          notification,
    ];
  }

  void markAllAsRead() {
    state = [
      for (final notification in state) notification.copyWith(isRead: true),
    ];
  }

  void removeNotification(String notificationId) {
    state = state
        .where((notification) => notification.id != notificationId)
        .toList();
  }

  void clearNotifications() {
    state = [];
  }
}
