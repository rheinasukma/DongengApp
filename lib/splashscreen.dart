import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dongeng/home.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffff4e07),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dongeng App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/welcome.png',
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
          )
        ],
      )),
    );
  }
}
