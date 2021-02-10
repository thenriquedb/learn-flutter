import 'package:flutter/material.dart';
import 'package:fluxo/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue), home: Splash()));
}
