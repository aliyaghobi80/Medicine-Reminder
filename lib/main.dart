import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/database_service.dart';
import 'routes/app_pages.dart';
import 'package:timezone/data/latest.dart' as tz;



final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // حتماً اول از همه فراخوانی شود

  // Initialize timezone
  tz.initializeTimeZones();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
  InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Hive.initFlutter(); // مقداردهی اولیه Hive

  await DatabaseService().initHive(); // مقداردهی اولیه دیتابیس Hive

  runApp(const MyApp()); // اجرای اپلیکیشن
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      initialRoute: '/splash',
      getPages: AppPages.routes,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
