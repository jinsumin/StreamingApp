import 'package:flutter/material.dart';
import 'package:streaming_app/model/model_movie.dart';
import 'package:streaming_app/widget/box_slider.dart';
import 'package:streaming_app/widget/circle_slider.dart';
import 'package:streaming_app/widget/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': "재벌집 막내아들",
      'keyword': "한국드라마/웹드라마",
      'poster': 'movie_posters.png',
      'like': false
    }),
    Movie.fromMap({
      'title': "보헤미안 랩소디",
      'keyword': "음악/드라마/인물",
      'poster': 'movie_posters.png',
      'like': false
    }),
    Movie.fromMap({
      'title': "사랑의 불시착",
      'keyword': "가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터",
      'poster': 'movie_posters.png',
      'like': false
    }),
    Movie.fromMap({
      'title': "포레스트 검프",
      'keyword': "드라마/외국",
      'poster': 'movie_posters.png',
      'like': false
    }),
    Movie.fromMap({
      'title': "쇼생크 탈출",
      'keyword': "추리/반전/서스펜스",
      'poster': 'movie_posters.png',
      'like': false
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Stack(children: <Widget>[
        CarouselImage(movies: movies),
        const TopBar(),
      ]),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies),
    ]);
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            'assets/net_logo.png',
            fit: BoxFit.contain,
            height: 30,
            width: 30,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '내가 찜한 컨텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
