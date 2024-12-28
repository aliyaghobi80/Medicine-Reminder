import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = DarwinInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: ios);

    _notificationsPlugin.initialize(settings);

    // مقداردهی اولیه مناطق زمانی
    tz.initializeTimeZones();
  }

  // متد برای زمان‌بندی نوتیفیکیشن
  Future<void> scheduleNotification(int id, String title, String body, DateTime scheduledTime) async {
    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);

    final androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.high,
      priority: Priority.high,
    );

    final iosDetails = DarwinNotificationDetails();
    final notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      // androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // برای زمان‌بندی دقیق روزانه
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  // لغو نوتیفیکیشن
  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }
}
