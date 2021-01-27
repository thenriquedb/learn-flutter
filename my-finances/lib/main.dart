import 'package:flutter/material.dart';
import 'package:fluxo/splash.dart';

void main() {
  // it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "Fluxo Caixa",
      home: Splash()));
}
