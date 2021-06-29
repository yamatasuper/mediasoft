import 'package:dnd_veilenar_assistant/pages/home_page/home_page.dart';
import 'package:dnd_veilenar_assistant/pages/home_page/providers/dice_roller_d20.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(DnDApp());
}

class DnDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ChangeNotifierProvider<D20DiceRoller>(
              create: (context) => D20DiceRoller(),
              child: HomePage(),
            ),
      },
      initialRoute: '/',
    );
  }
}
