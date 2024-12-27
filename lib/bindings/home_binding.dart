import 'package:get/get.dart';
import '../controllers/medicine_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineController>(() => MedicineController());
  }
}
