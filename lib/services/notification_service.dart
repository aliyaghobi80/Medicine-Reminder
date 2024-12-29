import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService() {
    _initializeNotifications();
  }

  // مقداردهی اولیه نوتیفیکیشن‌ها و منطقه زمانی
  void _initializeNotifications() {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final settings = InitializationSettings(android: android, iOS: ios);
    _notificationsPlugin.initialize(settings);

    // مقداردهی اولیه مناطق زمانی
    tz.initializeTimeZones();
  }

  // جزئیات نوتیفیکیشن
  NotificationDetails _notificationDetails() {
    final androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'Notification channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    final iosDetails = DarwinNotificationDetails();
    return NotificationDetails(android: androidDetails, iOS: iosDetails);
  }

  // نمایش نوتیفیکیشن ساده
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await _notificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails(),
    );
  }

  // زمان‌بندی نوتیفیکیشن
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    bool repeatDaily = false,
  }) async {
    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      _notificationDetails(),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: repeatDaily ? DateTimeComponents.time : null,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // لغو نوتیفیکیشن
  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  // لغو همه نوتیفیکیشن‌ها
  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }
}




// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   NotificationService() {
//     _initializeNotifications();
//   }
//
//   void _initializeNotifications() {
//     final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final ios = DarwinInitializationSettings();
//     final settings = InitializationSettings(android: android, iOS: ios);
//
//     _notificationsPlugin.initialize(settings);
//
//     // مقداردهی اولیه مناطق زمانی
//     tz.initializeTimeZones();
//   }
//
//     notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }
//
//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return _notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
//
//   Future scheduleNotification(
//       {int id = 0,
//         String? title,
//         String? body,
//         String? payLoad,
//         required DateTime scheduledNotificationDateTime}) async {
//     return _notificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.from(
//           scheduledNotificationDateTime,
//           tz.local,
//         ),
//         await notificationDetails(),
//
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.exact);
//   }
//   // // متد برای زمان‌بندی نوتیفیکیشن
//   // Future<void> scheduleNotification(int id, String title, String body, DateTime scheduledTime) async {
//   //   final tz.TZDateTime scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);
//   //
//   //   final androidDetails = AndroidNotificationDetails(
//   //     'channelId',
//   //     'channelName',
//   //     importance: Importance.high,
//   //     priority: Priority.high,
//   //   );
//   //
//   //   final iosDetails = DarwinNotificationDetails();
//   //   final notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
//   //
//   //   await _notificationsPlugin.zonedSchedule(
//   //     id,
//   //     title,
//   //     body,
//   //     scheduledDate,
//   //     notificationDetails,
//   //     // androidAllowWhileIdle: true,
//   //     uiLocalNotificationDateInterpretation:
//   //     UILocalNotificationDateInterpretation.absoluteTime,
//   //     matchDateTimeComponents: DateTimeComponents.time, // برای زمان‌بندی دقیق روزانه
//   //     androidScheduleMode: AndroidScheduleMode.exact,
//   //   );
//   // }
//
//   // لغو نوتیفیکیشن
//   Future<void> cancelNotification(int id) async {
//     await _notificationsPlugin.cancel(id);
//   }
// }


// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings('flutter_logo');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {});
//
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }
//
//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }
//
//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
//
//   Future scheduleNotification(
//       {int id = 0,
//         String? title,
//         String? body,
//         String? payLoad,
//         required DateTime scheduledNotificationDateTime}) async {
//     return notificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.from(
//           scheduledNotificationDateTime,
//           tz.local,
//         ),
//         await notificationDetails(),
//
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.exact);
//   }
// }