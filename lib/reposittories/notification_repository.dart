import '../services/notification_service.dart';

class NotificationRepository {
  final NotificationService _notificationService = NotificationService();

  void scheduleNotification(int id, String title, String body, {DateTime? scheduledTime}) {
    _notificationService.scheduleNotification(id: id,title:  title,body:  body,  scheduledTime: scheduledTime!);
  }

  void cancelNotification(int id) {
    _notificationService.cancelNotification(id);
  }
}
