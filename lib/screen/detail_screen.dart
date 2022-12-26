import 'package:flutter/material.dart';
import 'package:streaming_app/model/model_movie.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: ListView(children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/${widget.movie.poster}'),
                fit: BoxFit.cover,
              )),
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                              child: Column(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 45, 0, 10),
                              height: 300,
                              child:
                                  Image.asset('assets/${widget.movie.poster}'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              child: const Text(
                                '99% 일치 2022 16+ 시즌 1개',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              child: Text(
                                widget.movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(3),
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(Icons.play_arrow,
                                            color: Colors.white),
                                        Text('재생',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ]),
                                )),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Text(widget.movie.toString()),
                            ),
                            Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  '출연: 송중기, 이성민, 신현빈, ...\n장르: 한국 드라마, 한국 웹 드라마, 드라마',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 12),
                                ))
                          ])))))),
          Positioned(
              child: AppBar(
            backgroundColor: Colors.transparent,
          ))
        ],
      ),
      makeMenuButton(like),
    ]))));
  }
}

Widget makeMenuButton(like) {
  return Container(
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: InkWell(
                  onTap: () {},
                  child: Column(children: <Widget>[
                    like ? const Icon(Icons.check) : const Icon(Icons.add),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    const Text('내가 찜한 컨텐츠',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        )),
                  ]))),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                  child: Column(children: const <Widget>[
                Icon(Icons.thumb_up),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text('평가',
                    style: TextStyle(fontSize: 11, color: Colors.white60)),
              ]))),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                  child: Column(children: const <Widget>[
                Icon(Icons.send),
                Padding(padding: EdgeInsets.all(5)),
                Text('공유',
                    style: TextStyle(fontSize: 11, color: Colors.white60)),
              ])))
        ],
      ));
}
