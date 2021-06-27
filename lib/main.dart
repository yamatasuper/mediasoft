import 'package:flutter/material.dart';
import 'package:flutter_api/film_page.dart';
import 'package:flutter_api/lesson_6/files.dart';
import 'package:flutter_api/lesson_6/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final counter = 0;
  @override
  void initState() {
    super.initState();
    workWithSharedPreferences(counter);
    workWithFiles(counter);
  }
  @override
  Widget build(BuildContext context) {
    return FilmPage();
  }
}
