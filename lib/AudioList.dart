import 'package:flutter/material.dart';
import 'package:dongeng/model/dongeng.dart';
import 'package:dongeng/home.dart';

class AudioList extends StatelessWidget {
  List<Dongeng> DaftarAudio = [
    Dongeng(
      "https://i.pinimg.com/originals/df/0a/3e/df0a3e2ec30abb1c92d145ef165b714f.gif",
      "Singa dan Tikus",
      "Di sebuah hutan rimba...",
    ),
    Dongeng(
      "https://i.pinimg.com/originals/40/c3/be/40c3bef82a8077e5c872808eefff5c6d.png",
      "Rusa dan Pemburu",
      "Suatu ketika di hutan...",
    ),
    Dongeng(
      "https://image.freepik.com/free-vector/flat-design-baby-shark-cartoon-style_52683-36255.jpg",
      "Surabaya",
      "Suatu ketika di hutan...",
    ),
    Dongeng(
      "https://image.freepik.com/free-vector/fairytale-concept-with-child-reading_23-2148472951.jpg",
      "Sensetpier",
      "Suatu ketika di hutan...",
    ),
    Dongeng(
      "https://img.freepik.com/free-vector/spring-landscape-scene_23-2148860692.jpg",
      "Nature 5",
      "Suatu ketika di hutan...",
    ),
    Dongeng(
      "https://pw.artfile.me/wallpaper/20-03-2017/650x366/vektornaya-grafika-priroda--nature-sneg--1143282.jpg",
      "Night Nature",
      "Suatu ketika di hutan...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff4e07),
          title: const Text('Audio Page'),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(DaftarAudio[index].imageUrl))),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DaftarAudio[index].judul,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              DaftarAudio[index].sinopsis,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                MaterialButton(
                                  height: 10,
                                  minWidth: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.orangeAccent,
                                  onPressed: () {},
                                  child: const Text(
                                    "PLAY",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                MaterialButton(
                                  height: 10,
                                  minWidth: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.orangeAccent,
                                  onPressed: () {},
                                  child: const Text(
                                    "STOP",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: DaftarAudio.length)));
  }
}
