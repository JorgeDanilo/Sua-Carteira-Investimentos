import 'package:flutter/material.dart';

AppBar buildAppBar({String title}) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: Colors.orange,
    centerTitle: true,
    title:  Text(
      (title == null || title.isEmpty) ? "" : title.toUpperCase(),
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    )
  );
}