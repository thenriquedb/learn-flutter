import 'package:flutter/material.dart';
import 'package:tictactoe/core/theme_app.dart';
import 'package:tictactoe/pages/game_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic tac toe',
      debugShowCheckedModeBanner: false,
      theme: themeApp,
      home: GamePage(),
    );
  }
}
