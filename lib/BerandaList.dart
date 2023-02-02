import 'package:flutter/material.dart';
import 'package:dongeng/BacaPage.dart';
import 'BacaPage.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  Future<List> getData() async {
    final response = await http.get(
      Uri.parse(
          "https://63c78315e52516043f3f2fc8.mockapi.io/api/dongengapp/dongengan"),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dongeng App"),
        backgroundColor: Color(0xffff4e07),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.only(top: 5, left: 3, right: 3),
          child: GestureDetector(
            // onTap: () => Baca(),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Baca(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: Card(
              child: ListTile(
                leading: Image(
                  // height: 10,
                  // width: 10,
                  image: NetworkImage(list[i]['gmb']),
                ),
                title: Text(list[i]['judul']),
                subtitle: Text(list[i]['sinopsis']),
              ),
            ),
          ),
        );
      },
    );
  }
}
