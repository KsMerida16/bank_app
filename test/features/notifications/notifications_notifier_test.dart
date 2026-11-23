import 'package:bank_app/features/notifications/domain/entities/app_notification.dart';
import 'package:bank_app/features/notifications/presentation/state/notifications_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

AppNotification _n(String id, {bool read = false}) => AppNotification(
  id: id,
  title: 'Título $id',
  message: 'Mensaje $id',
  receivedAt: DateTime(2026, 11, 22),
  isRead: read,
);

void main() {
  late ProviderContainer container;
  NotificationsNotifier notifier() =>
      container.read(notificationsNotifierProvider.notifier);
  List<AppNotification> state() =>
      container.read(notificationsNotifierProvider);

  setUp(() => container = ProviderContainer());
  tearDown(() => container.dispose());

  test('inicia vacío', () => expect(state(), isEmpty));

  test('addNotification inserta la más reciente al inicio', () {
    notifier().addNotification(_n('1'));
    notifier().addNotification(_n('2'));

    expect(state().map((n) => n.id), ['2', '1']);
  });

  test('markAsRead solo marca la notificación indicada', () {
    notifier().addNotification(_n('1'));
    notifier().addNotification(_n('2'));

    notifier().markAsRead('1');

    expect(state().firstWhere((n) => n.id == '1').isRead, isTrue);
    expect(state().firstWhere((n) => n.id == '2').isRead, isFalse);
  });

  test('markAllAsRead marca todas', () {
    notifier().addNotification(_n('1'));
    notifier().addNotification(_n('2'));

    notifier().markAllAsRead();

    expect(state().every((n) => n.isRead), isTrue);
  });

  test('removeNotification y clearNotifications', () {
    notifier().addNotification(_n('1'));
    notifier().addNotification(_n('2'));

    notifier().removeNotification('1');
    expect(state().map((n) => n.id), ['2']);

    notifier().clearNotifications();
    expect(state(), isEmpty);
  });
}
