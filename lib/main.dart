import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_mobile_app/screen/splash_screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      defaultDevice: Devices.ios.iPhone16Pro,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Welcome to GemStore',

      scrollBehavior: MyCustomScrollBehavior(),

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xfffaf8f8),
      ),

      home: const SplashScreen(),

      locale: DevicePreview.locale(context),

      builder: DevicePreview.appBuilder,
    );
  }
}