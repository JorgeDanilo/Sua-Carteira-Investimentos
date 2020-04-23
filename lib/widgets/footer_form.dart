import 'package:flutter/material.dart';

Widget lowerHalf(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: screenHeight / 2,
      color: Color(0xFFECF0F3),
    ),
  );
}