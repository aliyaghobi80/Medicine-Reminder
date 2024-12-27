import '../services/notification_service.dart';

class NotificationRepository {
  final NotificationService _notificationService = NotificationService();

  void scheduleNotification(int id, String title, String body, DateTime dateTime) {
    _notificationService.scheduleNotification(id, title, body, dateTime);
  }

  void cancelNotification(int id) {
    _notificationService.cancelNotification(id);
  }
}
