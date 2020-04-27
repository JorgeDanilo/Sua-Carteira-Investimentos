import 'package:flutter/material.dart';

class Snack extends StatelessWidget {
  final String msg;

  Snack(this.msg);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(this.msg),
    );
  }
}
