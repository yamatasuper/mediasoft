import 'package:flutter/material.dart';
import 'package:flutter_api/lesson_6/files.dart';

class FilesWidget extends StatelessWidget {
  late final String filmsFromFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Фильмы из файла')),
      body: FutureBuilder<List<String>>(
        future: getFileFromAssets(),
        initialData: List.empty(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (_, index) => Text(
              snapshot.data?[index] ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
