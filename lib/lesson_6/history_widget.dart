import 'package:flutter/material.dart';
import 'package:flutter_api/main.dart';
import 'package:flutter_api/models/films_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('История поиска'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Films>(hiveBox).listenable(),
        builder: (_, Box<Films> box, __) {
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (_, index) {
              Films? film = box.getAt(index);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    film?.title ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(film?.year ?? ''),
                  Image.network(film?.poster ?? '', width: 100, height: 100,),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
