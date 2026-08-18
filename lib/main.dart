import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_mobile_app/screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      defaultDevice: Devices.ios.iPhone16Pro,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to our store. Enjoy you shopping',
      home: SplashScreen(),
    );
  }
}
