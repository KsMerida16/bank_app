import 'dart:convert';

import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/features/notifications/domain/entities/app_notification.dart';
import 'package:bank_app/features/notifications/presentation/state/notifications_notifier.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsService {
  NotificationsService({
    FirebaseMessaging? firebaseMessaging,
    FlutterLocalNotificationsPlugin? localNotifications,
  }) : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance,
       _localNotifications =
           localNotifications ?? FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotifications;

  static const String channelId = 'bank_app_channel';
  static const String channelName = 'Bank App Notifications';

  ProviderContainer? _container;

  Future<void> init(ProviderContainer container) async {
    _container = container;

    await _requestPermissions();
    await _initLocalNotifications();
    await _initRemoteNotifications();
    final initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  Future<void> _requestPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint('FCM permission: ${settings.authorizationStatus}');

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> _initRemoteNotifications() async {
    final token = await _firebaseMessaging.getToken();

    debugPrint('FCM Token: $token');

    // El token puede cambiar.
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token refreshed: $newToken');
    });
    FirebaseMessaging.onMessage.listen(_foregroundMessageHandler);
  }

  Future<void> _foregroundMessageHandler(RemoteMessage message) async {
    debugPrint('Foreground FCM received: ${message.messageId}');
    final notification = _createAppNotification(message);
    _container
        ?.read(notificationsNotifierProvider.notifier)
        .addNotification(notification);

    // Mostramos además una Local Notification.
    await _showLocalNotification(message);
  }

  AppNotification _createAppNotification(RemoteMessage message) {
    final title =
        message.notification?.title ??
        message.data['title']?.toString() ??
        'Notificación';

    final body =
        message.notification?.body ??
        message.data['body']?.toString() ??
        'Tienes una nueva notificación.';

    final type = _getNotificationType(message.data['type']?.toString());

    return AppNotification(
      id: message.messageId ?? DateTime.now().microsecondsSinceEpoch.toString(),

      title: title,

      message: body,

      receivedAt: DateTime.now(),

      type: type,

      isRead: false,
    );
  }

  NotificationType _getNotificationType(String? type) {
    switch (type?.toLowerCase()) {
      case 'transfer':
        return NotificationType.transfer;

      case 'payment':
        return NotificationType.payment;

      case 'security':
        return NotificationType.security;

      default:
        return NotificationType.general;
    }
  }

  Future<void> _initLocalNotifications() async {
    const channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: 'Channel for Bank App notifications',
      importance: Importance.max,
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(channel);
    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'Channel for Bank App notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const details = NotificationDetails(android: androidDetails);

    final notificationId =
        message.messageId?.hashCode ??
        DateTime.now().millisecondsSinceEpoch.remainder(2147483647);

    final title =
        message.notification?.title ??
        message.data['title']?.toString() ??
        'Notificación';

    final body =
        message.notification?.body ??
        message.data['body']?.toString() ??
        'Tienes una nueva notificación.';

    await _localNotifications.show(
      id: notificationId,
      title: title,
      body: body,
      notificationDetails: details,
      payload: jsonEncode(message.data),
    );
  }

  void _onLocalNotificationTap(NotificationResponse response) {
    debugPrint('Local notification tapped');

    _goToNotifications();
  }

  void _handleNotificationTap(RemoteMessage message) {
    debugPrint('Push notification tapped: ${message.messageId}');

    final notification = _createAppNotification(message);

    _container
        ?.read(notificationsNotifierProvider.notifier)
        .addNotification(notification);

    _goToNotifications();
  }

  void _goToNotifications() {
    final container = _container;

    if (container == null) {
      debugPrint('NotificationsService: ProviderContainer no disponible.');
      return;
    }

    try {
      final router = container.read(goRouterProvider);

      router.goNamed(Routes.notifications);
    } catch (e) {
      debugPrint('Error navigating to notifications: $e');
    }
  }
}
