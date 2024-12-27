
import 'package:hive/hive.dart';

part 'medicine_model.g.dart'; // این قسمت باید اضافه شود تا build_runner فایل g.dart را تولید کند



@HiveType(typeId: 32)
class Medicine {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dosage;

  @HiveField(2)
  final DateTime time;

  Medicine({
    required this.name,
    required this.dosage,
    required this.time,
  });
}


