import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final Function onPressed;

  CustomCard(this.id, this.title, this.description, this.onPressed);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Card(
        elevation: 3,
        child: Container(
          height: 35,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.title,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      this.description,
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    this.onPressed(this.id);
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0)),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        )));
  }
}
