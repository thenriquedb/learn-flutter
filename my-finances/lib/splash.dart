import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxo/views/pages/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    //espera 3 segundos do splash
    Future.delayed(Duration(seconds: 0)).then((_) {
      //muda para a proxima tela
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  //constroe a tela do splash
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          "Splash",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
