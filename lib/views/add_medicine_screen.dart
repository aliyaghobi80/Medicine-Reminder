import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/medicine_controller.dart';
import '../models/medicine_model.dart';
import '../widgets/date_time_picker_text.dart';

class AddMedicineScreen extends StatelessWidget {
  final MedicineController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();

  AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافه کردن دارو'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'نام دارو'),
            ),
            TextField(
              controller: dosageController,
              decoration: InputDecoration(labelText: 'دوز'),
            ),
            SizedBox(height: 20),
            DatePickerTxt(),
            // ScheduleBtn(),
            ElevatedButton(
              onPressed: () {
                final medicine = Medicine(
                  name: nameController.text,
                  dosage: dosageController.text,
                  time: scheduleTime,
                );
                print("ساعتش $scheduleTime");
                controller.addMedicine(medicine);

                Get.back();
              },
              child: Text('ذخیره'),
            ),
          ],
        ),
      ),
    );
  }
}
