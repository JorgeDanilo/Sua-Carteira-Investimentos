import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/di/di.dart';
import 'package:sua_carteira_investimentos/pages/login_page.dart';
import 'package:sua_carteira_investimentos/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

