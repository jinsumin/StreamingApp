import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const TopBar();
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
          Container(padding: const EdgeInsets.only(right: 1), child: const Text(
            'TV 프로그램',
            style: TextStyle(fontSize: 14),
          ),),
          Container(padding: const EdgeInsets.only(right: 1), child: const Text(
            '영화',
            style: TextStyle(fontSize: 14),
          ),),
          Container(padding: const EdgeInsets.only(right: 1), child: const Text(
            '내가 찜한 컨텐츠',
            style: TextStyle(fontSize: 14),
          ),),
        ],
      ),
    );
  }
}
