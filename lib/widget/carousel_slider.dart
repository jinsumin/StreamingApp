import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  const CarouselImage({super.key, required this.movies});

  @override
  CarouselImageState createState() => CarouselImageState();
}

class CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  int currentPage = 0;
  String currentKeyword = '';

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./assets/${m.poster}')).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
                currentKeyword = keywords[currentPage];
              });
            }),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              currentKeyword,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[currentPage]
                          ? IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                      const Text(
                        '내가 찜한 컨텐츠',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () {},
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '재생',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ))),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                      ),
                      const Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, currentPage),
            )
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i
              ? const Color.fromRGBO(255, 255, 255, 0.9)
              : const Color.fromRGBO(255, 255, 255, 0.4),
        )));
  }

  return results;
}
