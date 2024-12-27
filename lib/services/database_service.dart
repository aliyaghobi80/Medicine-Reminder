import 'package:hive/hive.dart';
import '../models/medicine_model.dart'; // مدل‌های شما

class DatabaseService {
  Future<void> initHive() async {

      if (!Hive.isAdapterRegistered(32)) {
        Hive.registerAdapter(MedicineAdapter());
      }// ثبت آداپتر Medicine
    await Hive.openBox<Medicine>('medicines'); // باز کردن جعبه Medicine
  }
}
