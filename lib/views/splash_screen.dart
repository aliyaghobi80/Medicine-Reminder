import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // زمان نمایش اسپلش اسکرین قبل از رفتن به صفحه اصلی
    Timer(Duration(seconds: 3), () {
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A90E2), // رنگ پس زمینه اسپلش اسکرین
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // لوگوی اپلیکیشن
            Image.asset('assets/images/logo.png', width: 150, height: 150),
            // لوگوی اپلیکیشن
            SizedBox(height: 20),
            // متن زیر لوگو
            Text(
              'یادآوری دارو',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // آیکون‌های قرص‌ها و ساعت به عنوان پس‌زمینه
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


