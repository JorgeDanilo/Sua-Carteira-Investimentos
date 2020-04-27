import 'package:flutter/cupertino.dart';
import 'package:sua_carteira_investimentos/core/bloc.dart';
import 'package:sua_carteira_investimentos/di/di.dart';

abstract class WidgetState<T extends StatefulWidget, B extends Bloc> extends State<T> {

  B bloc;

  WidgetState() {
    bloc = getIt<B>();
  }

  @override
  void dispose() {
    bloc.onDispose();
    super.dispose();
  }
}