// import 'dart:html';

import 'package:dongeng/VideoList.dart';
import 'package:flutter/material.dart';
import 'package:dongeng/VideoPage.dart';
import 'BerandaList.dart';
import 'AudioList.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key : key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTabIndex = 0;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      Beranda(),
      AudioList(),
      Video(),
    ];
    final _bottomNavigationBarItem = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.audio_file), label: "Audio"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.video_library), label: "Video"),
    ];

    final _bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.blue,
      backgroundColor: Color(0xffff4e07),
      items: _bottomNavigationBarItem,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Colors.white54,
      selectedItemColor: Colors.white,
      onTap: _onNavbarTapped,
    );

    return Scaffold(
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
