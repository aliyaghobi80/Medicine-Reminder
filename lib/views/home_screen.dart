
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshi/controllers/notification_controller.dart';

import '../controllers/medicine_controller.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatelessWidget {
  final NotificationService notificationService = NotificationService();
  final NotificationController notificationController =
      NotificationController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MedicineController controller = Get.find();


    return Scaffold(
      appBar: AppBar(
        title: Text('My Medicines'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.medicines.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.medicines[index].name),
              subtitle: Text(
                  'Dosage: ${controller.medicines[index].dosage} , Time: ${controller.medicines[index].time}'),
              trailing: IconButton(
                  icon: Icon(Icons.notification_add),
                  onPressed: () {
                    notificationController.showBigTextNotification(
                        title: 'سلام علی ',
                        body: 'امید وارم که حالت عالی باشه بسر 😎',
                        fln: notificationController
                            .flutterLocalNotificationsPlugin);

                    }
                  ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add_medicine');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
