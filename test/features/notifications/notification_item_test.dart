import 'package:bank_app/features/notifications/domain/entities/app_notification.dart';
import 'package:bank_app/features/notifications/presentation/widgets/notifications_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) =>
    MaterialApp(home: Scaffold(body: child));

void main() {
  testWidgets('muestra título, mensaje y llama onTap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        NotificationItem(
          notification: AppNotification(
            id: '1',
            title: 'Transferencia recibida',
            message: 'Recibiste Q500.00',
            receivedAt: DateTime.now(),
            type: NotificationType.transfer,
          ),
          onTap: () => taps++,
        ),
      ),
    );

    expect(find.text('Transferencia recibida'), findsOneWidget);
    expect(find.text('Recibiste Q500.00'), findsOneWidget);
    expect(find.text('Ahora'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_downward_rounded), findsOneWidget);

    await tester.tap(find.byType(NotificationItem));
    expect(taps, 1);
  });

  testWidgets('el ícono depende del tipo de notificación', (tester) async {
    await tester.pumpWidget(
      _wrap(
        NotificationItem(
          notification: AppNotification(
            id: '2',
            title: 'Alerta',
            message: 'Inicio de sesión nuevo',
            receivedAt: DateTime.now(),
            type: NotificationType.security,
            isRead: true,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.security_rounded), findsOneWidget);
  });
}
