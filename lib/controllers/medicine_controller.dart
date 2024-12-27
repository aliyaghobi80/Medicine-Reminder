
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/medicine_model.dart';


class MedicineController extends GetxController {
  var medicines = <Medicine>[].obs; // یک لیست Observable از داروها


  void addMedicine(Medicine medicine) {
    print('Trying to add medicine: ${medicine.name}');

    var box = Hive.box<Medicine>('medicines');
    if (kDebugMode) {
      print('Trying to add medicine:  ${box.values.last.name}');
    }

    box.add(medicine).then((value) {
      print('Medicine added to Hive: ${medicine.name}');
    }).catchError((error) {
      print('Failed to add medicine: $error');
    });

    medicines.add(medicine);
    print('Medicine added to list: ${medicines.length}');
  }

  void removeMedicine(int index) {
    medicines.removeAt(index);
    Hive.box<Medicine>('medicines').deleteAt(index); // حذف دارو از Hive
  }
}
