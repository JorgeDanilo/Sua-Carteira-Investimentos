import 'package:flutter/material.dart';

Widget upperHalf(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Container(
    height: screenHeight / 2,
    child: Image.asset(
      'assets/images/logo_home.jpg',
      fit: BoxFit.cover,
    ),
  );
}