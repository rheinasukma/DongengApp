import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Baca extends StatefulWidget {
  final List list;
  final int index;

  Baca({this.list, this.index});

  @override
  _BacaState createState() => _BacaState();
}

class _BacaState extends State<Baca> {
  TextEditingController judulController;
  TextEditingController isiController;
  TextEditingController gmbController;

  void Baca() {
    var url = Uri.parse(
        "https://63c78315e52516043f3f2fc8.mockapi.io/api/dongengapp/dongengan");
    http.put(url, body: {
      "judul": judulController.text,
      "isi": isiController.text,
      "gmb": gmbController.text,
    });
  }

  @override
  void initState() {
    judulController =
        TextEditingController(text: widget.list[widget.index]['judul']);
    isiController =
        TextEditingController(text: widget.list[widget.index]['isi']);
    gmbController =
        TextEditingController(text: widget.list[widget.index]['gmb']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff4e07),
        title: Text(judulController.text),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.network(gmbController.text),
            SizedBox(
              height: 40,
            ),
            Text(isiController.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
