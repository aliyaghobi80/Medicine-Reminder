import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/medicine_controller.dart';
import '../controllers/notification_controller.dart';
import '../services/notification_service.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeScreen extends StatelessWidget {
  final CalendarController controllerCalender = Get.put(CalendarController());

  final NotificationService notificationService = NotificationService();
  final NotificationController notificationController =
      NotificationController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MedicineController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                            'assets/images/avatar.png'), // تصویر آواتار
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ",سلام",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "علی یعقوبی",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "یک یادآور ایجاد کنید",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/add_medicine');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("ایجاد"),
                  ),
                ],
              ),
            ),

            // Calendar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        controllerCalender.selectedDayIndex.value =
                            index; // Update the selected day
                      },
                      child: Obx(() {
                        final isSelected =
                            index == controllerCalender.selectedDayIndex.value;
                        return Column(
                          children: [
                            Text(
                              ["M", "T", "W", "T", "F", "S", "S"][index],
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isSelected ? Colors.blue : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue : Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Medicine List
            Expanded(
              child: Obx(() {
                if (controller.medicines.isEmpty) {
                  return Center(
                    child: Text(
                      "دارویی یافت نشد",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: controller.medicines.length,
                  itemBuilder: (context, index) {
                    final medicine = controller.medicines[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/VitaminC.png', // تصویر دارو
                          width: 48,
                          height: 48,
                        ),
                        title: Text(
                          medicine.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("${medicine.dosage} • ${medicine.time}"),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // عملکرد روی دارو
                          Get.dialog(
                            Center(
                              child: Container(
                                width: Get.context!.size!.width * 0.8,
                                height: Get.context!.size!.width * 0.6,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blueGrey.shade800,
                                        // رنگ یخی (آبی روشن)

                                        Colors.grey.shade900,
                                        // رنگ بنفش
                                      ],
                                      begin: Alignment.topLeft,
                                      // نقطه شروع طیف
                                      end: Alignment.bottomRight,
                                      // نقطه پایان طیف
                                      stops: [0.1, 0.8], // مکان توقف
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // Medicine data
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            Text(
                                              "نام: ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Text(
                                              medicine.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            Text(
                                              "دوز: ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Text(
                                              medicine.dosage,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            Text(
                                              "تاریخ: ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Text(
                                              medicine.time.toPersianDate(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey.shade200,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            Text(
                                              "ساعت: ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Text(
                                              "${medicine.time.hour}:${medicine.time.minute}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //delete medicine
                                          ElevatedButton(
                                            onPressed: () async {
                                              // نمایش پیام حذف
                                              String nameDaro = " دارو ${controller.medicines[index].name} با موفقیت حذف شد "
                                              ;
                                              Get.back();

                                              Get.snackbar('حذف شد',nameDaro,
                                                  colorText: Colors.black,
                                                  snackStyle: SnackStyle.GROUNDED,
                                                  duration: Duration(seconds: 3),
                                                  icon: Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                  ));
                                              // ایجاد تاخیر برای نمایش پیام
                                              await Future.delayed(
                                                  Duration(seconds: 1));
                                              // حذف دارو
                                              controller.removeMedicine(index);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: const Text("حذف دارو"),
                                          ),
                                          //notification
                                          ElevatedButton(
                                            onPressed: () {
                                              String name = controller
                                                  .medicines[index].name;
                                              String dosage = controller
                                                  .medicines[index].dosage;
                                              DateTime time = controller
                                                  .medicines[index].time;
                                              notificationController
                                                  .showBigTextNotification(
                                                      title: controller
                                                          .medicines[index]
                                                          .name,
                                                      body:
                                                          'شما داروی $name با دوز $dosage را باید در ساعت $time مصرف کنید',
                                                      fln: notificationController
                                                          .flutterLocalNotificationsPlugin);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.black,
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: const Text("یادآوری"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarController extends GetxController {
  var selectedDayIndex = (-1).obs; // Observable integer
}

// onPressed: () {
// notificationController.showBigTextNotification(
// title: 'سلام علی ',
// body: 'امید وارم که حالت عالی باشه بسر 😎',
// fln: notificationController
// .flutterLocalNotificationsPlugin);
// }
