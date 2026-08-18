import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_mobile_app/screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      defaultDevice: Devices.ios.iPhone16Pro,
      builder: (context) => MyApp(),
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Welcome to GenStore.',
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
