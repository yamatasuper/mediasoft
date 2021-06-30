import 'dart:convert';

import 'package:flutter_application_1/model/bored.dart';
import 'package:http/http.dart' as http;

Future<Bored> getBoredFromApi() async {
  http.Response response =
      await http.get(Uri.parse('https://www.boredapi.com/api/activity'));
  return Bored.fromJson(jsonDecode(response.body));
}
