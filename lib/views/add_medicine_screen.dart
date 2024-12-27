import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/medicine_controller.dart';
import '../models/medicine_model.dart';

class AddMedicineScreen extends StatelessWidget {
  final MedicineController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();

  AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: dosageController,
              decoration: InputDecoration(labelText: 'Dosage'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final medicine = Medicine(
                  name: nameController.text,
                  dosage: dosageController.text,
                  time: DateTime.now(),
                );
                controller.addMedicine(medicine);
                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
