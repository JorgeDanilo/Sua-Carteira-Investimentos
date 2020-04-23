import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/constantes/contantes.dart';
import 'package:sua_carteira_investimentos/widgets/heading.dart';
import 'package:sua_carteira_investimentos/widgets/transation.dart';

class LastTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Heading(
          title: 'Últimas transações',
        ),
        SizedBox(
          height: 25.0,
        ),
        Flexible(
          child: Container(
            height: deviceSize.height * 0.5,
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