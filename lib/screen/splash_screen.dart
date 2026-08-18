import 'package:e_commerce_mobile_app/screen/home_screen.dart';
import 'package:e_commerce_mobile_app/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_provider/svg_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isExtended = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      _isExtended = true;
    });
    await Future.delayed(Duration(milliseconds: 4500));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );

    // final SharedPreferences preferences = await SharedPreferences.getInstance();
    // final String? token = preferences.getString('sv16.token');
    // if (token == null) {
    //   if (!mounted) return;
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => LoginScreen()),
    //     (route) => false,
    //   );
    // } else {
    //   if (!mounted) return;
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => Homescreen()),
    //     (route) => false,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: _isExtended ? 1 : 0,
              duration: Duration(milliseconds: 2500),
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
  }
}
