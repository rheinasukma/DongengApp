import 'package:dongeng/AudioList.dart';
import 'package:dongeng/VideoList.dart';
import 'package:dongeng/home.dart';
import 'package:flutter/material.dart';
import 'package:dongeng/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
