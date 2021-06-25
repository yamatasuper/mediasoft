import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/api/films_api.dart';
import 'package:flutter_api/models/films_model.dart';

class FilmPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FilmPage> {
  late Films film;
  bool _isLoading = true;
  late String searchFilm;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () async {
            final response = await RepositoryFilm().loadFilm();
            if (response != null) {
              print(response);
              film = response;
              setState(() {
                _isLoading = false;
              });
            }
          },
          child: Container(
            child: Text(
              'Начать загрузку',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TextField(
                  onChanged: (value) {
                    searchFilm = value;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    final response =
                        await RepositoryFilm().loadFilmWithName(searchFilm);
                    if (response != null) {
                      print(response);
                      film = response;
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Text("начать загрузку еще раз"),
                ),
                Text(film.title),
                Image.network(
                  film.poster,
                  height: 350,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: film.ratings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        child: Row(
                          children: [
                            Text(film.ratings[index].source),
                            Text(film.ratings[index].value),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}