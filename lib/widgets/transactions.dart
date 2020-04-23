import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/constantes/contantes.dart';
import 'package:sua_carteira_investimentos/widgets/heading.dart';
import 'package:sua_carteira_investimentos/widgets/transation.dart';

class Transactions extends StatelessWidget {

  final double height;
  final String name;
  final bool isSpacing;
  Transactions({this.name = "", this.height = 0.5, this.isSpacing = true});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        (this.isSpacing) ? SizedBox(height: 10.0) : Container(),
        Heading(
          title: this.name,
        ),
        (this.isSpacing) ? SizedBox(height: 25.0) : Container(),
        Flexible(
          child: Container(
            height: deviceSize.height * this.height,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, int index) => Transaction(
                transaction: transactions[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}