import '../models/medicine_model.dart';
import 'package:hive/hive.dart';

class MedicineRepository {
  final _medicineBox = Hive.box<Medicine>('medicines');

  List<Medicine> getAllMedicines() {
    return _medicineBox.values.toList().cast<Medicine>();
  }

  void addMedicine(Medicine medicine) {
    _medicineBox.add(medicine);
  }

  void deleteMedicine(int index) {
    _medicineBox.deleteAt(index);
  }
}
