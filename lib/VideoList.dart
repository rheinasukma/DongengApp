import 'package:flutter/material.dart';
import 'package:dongeng/VideoPage.dart';
import 'BacaPage.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPage(),
              ),
            ),
            child: Card(
              child: ListTile(
                leading: Image(
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





// import 'package:flutter/material.dart';
// import 'VideoPage.dart';

// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Video extends StatefulWidget {
//   @override
//   _VideoState createState() => _VideoState();
// }

// class _VideoState extends State<Video> {
//   Future<List> getData() async {
//     final response = await http.get(
//       Uri.parse(
//           "https://63c78315e52516043f3f2fc8.mockapi.io/api/dongengapp/dongengan"),
//     );
//     return json.decode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Dongeng App"),
//         backgroundColor: Color(0xffff4e07),
//       ),
//       body: FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? ItemList(
//                   list: snapshot.data,
//                 )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 );
//         },
//       ),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     //   return ListView.builder(
//     //       itemCount: list == null ? 0 : list.length,
//     //       itemBuilder: (context, i) {
//     //         return Container(
//     //           padding: EdgeInsets.only(top: 5, left: 3, right: 3),
//     //           // child: GestureDetector(
//     //           //   onTap: () => _selectItem(context),
//     //           child: Hero(
//     //             // key: Key(_item.imageUrl),
//     //             // tag: Text(
//     //             //   (list[i]['judul']),

//     //             child: Image.network(
//     //               (list[i]['gmb']),
//     //               fit: BoxFit.cover,
//     //             ),

//     //             tag: (list[i]['judul']),
//     //           ),
//     //         );
//     //       });
//     // }

//     return ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return Container(
//           padding: EdgeInsets.only(top: 5, left: 3, right: 3),
//           child: GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Video(
//                   list: list,
//                   index: i,
//                 ),
//               ),
//             ),
//             // onTap: () => Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => VideoPage(
//             //       list: list,
//             //       index: i,
//             //     ),
//             //   ),
//             // ),
//             child: Card(
//               child: ListTile(
//                 leading: Image(
//                   // height: 10,
//                   // width: 10,
//                   image: NetworkImage(list[i]['gmb']),
//                 ),
//                 title: Text(list[i]['judul']),
//                 // leading: Icon(Icons.person),
//                 // // subtitle: Text("${list[i]['nim']}"),
//                 subtitle: Text(list[i]['sinopsis']),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // class Video extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xffff4e07),
// //         title: Text('Video Page'),
// //       ),
// //       body: GridView.count(
// //         padding: const EdgeInsets.all(10),
// //         crossAxisCount: 1,
// //         children: <Widget>[
// //           Container(
// //             height: 400,
// //             width: 400,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Card(
// //                   margin: const EdgeInsets.all(10),
// //                   child: InkWell(
// //                     onTap: () {
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) => VideoPage()));
// //                     },
// //                     splashColor: Colors.orangeAccent,
// //                     child: Center(
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: const <Widget>[
// //                           Icon(
// //                             Icons.home,
// //                             size: 200,
// //                             color: Colors.orange,
// //                           ),
// //                           Text("Video", style: TextStyle(fontSize: 17.0)),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }




// // class ItemList extends StatelessWidget {
// //   final List list;
// //   ItemList({this.list});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: list == null ? 0 : list.length,
// //       itemBuilder: (context, i) {
// //         return Container(
// //           padding: EdgeInsets.only(top: 5, left: 3, right: 3),
// //           child: GestureDetector(
// //             child: Card(
// //               child: ListTile(
// //                 title: Text(list[i]['judul']),
// //                 leading: Icon(Icons.person),
// //                 // subtitle: Text("${list[i]['nim']}"),
// //                 subtitle: Text(list[i]['sinopsis']),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
