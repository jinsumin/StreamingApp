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
                child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/${widget.movie.poster}'),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ],
                      ),
                      makeMenuButton(),
                    ]
                )
            )
        )
    )
  }
}

Widget makeMenuButton() {
  return Container();
}
