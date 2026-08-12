enum NotificationType { general, transfer, payment, security }

class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.receivedAt,
    this.type = NotificationType.general,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String message;
  final DateTime receivedAt;
  final NotificationType type;
  final bool isRead;

  AppNotification copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? receivedAt,
    NotificationType? type,
    bool? isRead,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      receivedAt: receivedAt ?? this.receivedAt,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }
}
