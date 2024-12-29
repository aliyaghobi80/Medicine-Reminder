
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../services/notification_service.dart';

DateTime scheduleTime = DateTime.now();

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    super.key,
  });

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) => scheduleTime = date,
          onConfirm: (date) {},
        );
      },
      child: const Text(
        'تایم',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('نوتیف'),
      onPressed: () {

        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
          id: 0,
            title: 'Scheduled Notification',
            body: '$scheduleTime',
            scheduledTime: scheduleTime);
      },
    );
  }
}