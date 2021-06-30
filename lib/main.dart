import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/film_page.dart';
import 'package:flutter_api/lesson_6/files.dart';
import 'package:flutter_api/lesson_6/shared_preferences.dart';
import 'package:flutter_api/models/films_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String hiveBox = 'history';

void main() async {
  //Инициализация Hive
  await Hive.initFlutter();
  //Регистрация сгенерированного адаптера для нашей модели фильма
  Hive.registerAdapter(FilmsAdapter());
  Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<Films>(hiveBox);
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
      debugShowCheckedModeBanner: false,
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

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
