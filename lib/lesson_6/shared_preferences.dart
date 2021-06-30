import 'package:shared_preferences/shared_preferences.dart';

void workWithSharedPreferences(int counter) async {
  // Получаем доступ к экземпляру хранилища
  final prefs = await SharedPreferences.getInstance();

  // Записываем переменную counter по строковому ключу 'counter'
  prefs
      .setInt('counter', counter)
      .then((bool isDone) => print('Set int: $isDone'));

  //Получаем значение по этому же ключу 'counter'
  print('Get int: ${prefs.getInt('counter')}');

  //Можно удалить данные
  prefs.remove('counter');
}
