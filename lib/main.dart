import 'package:flutter/material.dart';
import 'package:streaming_app/widget/bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamingApp',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
              body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
            bottomNavigationBar: const Bottom(),
          ),

      ),
    );
  }
}
