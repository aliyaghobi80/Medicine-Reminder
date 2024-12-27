import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'services/database_service.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // اضافه کنید


  await Hive.initFlutter(); // مقداردهی اولیه Hive



  // تنظیم مسیر ذخیره‌سازی برای Hive
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path); // مقداردهی Hive با مسیر ذخیره‌سازی

  await DatabaseService().initHive(); // مقداردهی اولیه دیتابیس Hive

  runApp(MyApp());
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
