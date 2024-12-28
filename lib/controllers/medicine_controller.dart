
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/medicine_model.dart';


class MedicineController extends GetxController {
  var medicines = <Medicine>[].obs; // یک لیست Observable از داروها

  @override
  void onInit() {
    super.onInit();
    _loadMedicines(); // بارگذاری داده‌ها هنگام مقداردهی اولیه
  }

  void _loadMedicines() {
    var box = Hive.box<Medicine>('medicines');
    if (box.values.isNotEmpty) {
      medicines.addAll(box.values.cast<Medicine>()); // اضافه کردن داده‌های موجود به لیست Observable
      if (kDebugMode) {
        print('Medicines loaded from Hive: ${medicines.length}');
      }
    } else {
      if (kDebugMode) {
        print('No medicines found in Hive.');
      }
    }
  }

  void addMedicine(Medicine medicine) {
    print('Trying to add medicine: ${medicine.name}');
    var box = Hive.box<Medicine>('medicines');

    box.add(medicine).then((value) {
      medicines.add(medicine); // فقط بعد از موفقیت در ذخیره به لیست اضافه کنید
      print('Medicine added to Hive and list: ${medicine.name}');
    }).catchError((error) {
      print('Failed to add medicine: $error');
    });
  }

  void removeMedicine(int index) {
    try {
      var box = Hive.box<Medicine>('medicines');
      box.deleteAt(index); // حذف از Hive
      medicines.removeAt(index); // حذف از لیست Observable
      print('Medicine removed at index $index');
    } catch (e) {
      print('Failed to remove medicine: $e');
    }
  }
}

