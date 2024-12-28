import 'package:hive/hive.dart';
import '../models/medicine_model.dart'; // مدل Medicine

class DatabaseService {
  Future<void> initHive() async {
    // ثبت آداپتر Medicine در صورت عدم ثبت قبلی
    if (!Hive.isAdapterRegistered(32)) {
      Hive.registerAdapter(MedicineAdapter());
    }

    // بررسی باز بودن جعبه قبل از باز کردن آن
    if (!Hive.isBoxOpen('medicines')) {
      await Hive.openBox<Medicine>('medicines'); // باز کردن جعبه
      print("Box 'medicines' is opened.");
    } else {
      print("Box 'medicines' is already open.");
    }

    // دسترسی به داده‌ها در جعبه
    var medicineBox = Hive.box<Medicine>('medicines');
    if (medicineBox.isNotEmpty) {
      print("Data in 'medicines' box: ${medicineBox.values}");
    } else {
      print("No data found in 'medicines' box.");
    }
  }
}
