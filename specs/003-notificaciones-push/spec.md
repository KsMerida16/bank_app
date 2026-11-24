# 003 — Notificaciones push con FCM (HU 4.3)

## Objetivo
Informar al cliente de eventos relevantes (transferencias, pagos, seguridad, promociones) en primer y segundo plano.

## Criterios de aceptación
- [x] Solicita permisos y obtiene token FCM.
- [x] Foreground: se agrega a la bandeja de la app y se muestra notificación local.
- [x] Tap en la notificación abre la pantalla de notificaciones.
- [x] Bandeja: marcar leída / todas / eliminar / limpiar.
- [x] El token FCM no se imprime en logs.
- [ ] El token se asocia al usuario autenticado (para enviar push dirigidos).
- [ ] Handler de mensajes en background (`onBackgroundMessage`) para persistir la bandeja.

## Riesgos
Datos sensibles en el cuerpo de la notificación (no incluir saldos completos); token expuesto en logs.
