import 'package:flutter/material.dart';

AppBar buildAppBar({String name}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.orange,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Bem Vindo!',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Jorge Danilo'.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}