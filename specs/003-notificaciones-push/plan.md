# Plan — Notificaciones
- `NotificationsService` (core) integra `firebase_messaging` + `flutter_local_notifications`.
- `NotificationsNotifier` (Riverpod `Notifier`) mantiene la bandeja en memoria.
- `NotificationsPage` + `NotificationItem` (presentation).

## Pruebas
`notifications_notifier_test.dart`, `notification_item_test.dart`.
