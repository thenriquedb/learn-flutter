import 'package:flutter/material.dart';
import 'package:fluxo/views/pages/menu.dart';
import 'package:fluxo/views/widgets/custom_button.dart';
import 'package:fluxo/views/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _onClickLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Navegar(0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: CustomTextField(
              nameController,
              labelText: 'Email',
              hintText: 'youremail@email.com',
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: CustomTextField(
                passwordController,
                labelText: 'Senha',
                hintText: '******',
                obscureText: true,
              )),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CustomButton(_onClickLogin, label: 'Login'),
          ),
        ],
      ),
    ));
  }
}
