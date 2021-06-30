import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/api/films_api.dart';
import 'package:flutter_api/lesson_6/files_widget.dart';
import 'package:flutter_api/lesson_6/history_widget.dart';
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
      appBar: _appBar(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      searchFilm = value;
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      final response = await RepositoryFilm().loadFilmWithName(searchFilm);
                      if (response != null) {
                        print(response);
                        film = response;
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Text("Начать загрузку еще раз"),
                  ),
                  Text(film.title),
                  Image.network(
                    film.poster,
                    height: 300,
                  ),
                  ListView.builder(
                    itemCount: film.ratings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(film.ratings[index].source),
                            SizedBox(width: 10),
                            Text(film.ratings[index].value),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.history),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryWidget()));
          },
        ),
        IconButton(
          icon: Icon(Icons.file_download),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FilesWidget()));
          },
        ),
      ],
    );
  }
}
