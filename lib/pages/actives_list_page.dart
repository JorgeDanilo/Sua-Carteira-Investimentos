import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/pages/drawer_list.dart';
import 'package:sua_carteira_investimentos/widgets/app_bar.dart';
import 'package:sua_carteira_investimentos/widgets/last_transactions.dart';

class ActiveListPage extends StatefulWidget {
  @override
  _ActiveListPageState createState() => _ActiveListPageState();
}

class _ActiveListPageState extends State<ActiveListPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerList(),
      appBar: buildAppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.orange,
            height: deviceSize.height * 0.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.03,
            ),
            child: Column(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      LastTransactions(name: "Seus Ativos", height: 0.8,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
