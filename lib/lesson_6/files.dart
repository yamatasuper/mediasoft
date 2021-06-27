import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> _localPath() async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> _localFile() async {
  final path = await _localPath();
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile();

  // Запись в файл
  return file.writeAsString('$counter');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile();

    // Чтение из файла
    final content = await file.readAsString();

    return int.parse(content);
  } catch (exception) {
    return 0;
  }
}

void workWithFiles(int counter) async {
  await writeCounter(counter).then((File newFile) => print(newFile));
  await readCounter().then(print);
}