import 'package:flutter_api/main.dart';
import 'package:flutter_api/models/films_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class RepositoryFilm {
  Future<Films?> loadFilm() async => await GetFilmInteractor().execute();
  Future<Films?> loadFilmWithName(String name) async =>
      await GetFilmInteractor().executeWithName(name);
}

class GetFilmInteractor {
  Future<Films?> execute() async {
    try {
      Response response = await takeFilm();
      if (response.statusCode == 200) {
        return _parseResult(response);
      }
    } catch (ex) {
      return null;
    }
  }

  Future<Films?> executeWithName(String name) async {
    try {
      Response response = await takeFilmWithName(name);
      if (response.statusCode == 200) {
        return _parseResult(response);
      }
    } catch (ex) {
      return null;
    }
  }

  Future<Films?> _parseResult(Response response) async{
    Films result;
    final box = await Hive.openBox<Films>(hiveBox);
    print(response.body);
    final data = json.decode(response.body);
    result = Films.fromJson(data);
    //Сохранение в БД
    box.add(result);
    return result;
  }
}

Future<Response> takeFilm() async {
  final Uri uri =
      Uri.parse('https://www.omdbapi.com/?apikey=beff57c&t=Blade+Runner');
  return await http.post(uri);
}

Future<Response> takeFilmWithName(String name) async {
  final Uri uri = Uri.parse('https://www.omdbapi.com/?apikey=beff57c&t=$name');
  return await http.post(uri);
}
