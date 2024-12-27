import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initialize(flutterLocalNotificationsPlugin);
  }

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationsSettings = InitializationSettings(
      android: androidInitialize,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

   Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    ); // AndroidNotificationDetails

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    ); // NotificationDetails
    await fln.show(0, title, body, not);
  }
}
