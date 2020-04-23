import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/helpers/navigator.dart';
import 'package:sua_carteira_investimentos/pages/active_new_page.dart';

AppBar buildAppBar({String title, BuildContext context, bool showActions = true}) {
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
    ),
    actions: <Widget>[
      showActions ?
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          push(context, ActiveNewPage(), replace: false);
        },
      ) : Container(),
    ],
  );
}