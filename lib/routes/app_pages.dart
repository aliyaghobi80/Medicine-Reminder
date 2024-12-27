import 'package:get/get.dart';
import '../views/add_medicine_screen.dart';
import '../bindings/home_binding.dart';
import '../bindings/medicine_binding.dart';
import '../views/home_screen.dart';
import '../views/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(), // اضافه کردن اسپلش اسکرین
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/add_medicine',
      page: () => AddMedicineScreen(),
      binding: MedicineBinding(),
    ),
  ];
}

