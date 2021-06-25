import 'package:flutter_api/models/films_model.dart';
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
    Films result;
    try {
      Response response = await takeFilm();
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);
        result = Films.fromJson(data);
        return result;
      }
    } catch (ex) {
      return null;
    }
  }

  Future<Films?> executeWithName(String name) async {
    Films result;
    try {
      Response response = await takeFilmWithName(name);
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);
        result = Films.fromJson(data);
        return result;
      }
    } catch (ex) {
      return null;
    }
  }
}

Future<Response> takeFilm() async {
  final Uri uri =
      Uri.parse('http://www.omdbapi.com/?apikey=b0839b58&t=Blade+Runner');
  return await http.post(uri);
}

Future<Response> takeFilmWithName(String name) async {
  final Uri uri = Uri.parse('http://www.omdbapi.com/?apikey=b0839b58&t=$name');
  return await http.post(uri);
}
