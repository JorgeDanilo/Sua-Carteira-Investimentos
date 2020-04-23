import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/pages/drawer_list.dart';
import 'package:sua_carteira_investimentos/widgets/top_account_info.dart';
import 'package:sua_carteira_investimentos/widgets/transactions.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            height: deviceSize.height * 0.1,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.03,
            ),
            child: Column(
              children: <Widget>[
                TopAccountInfo(),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Transactions(),
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

  builderUserInfo(BuildContext context) => Container(
        color: Colors.orange,
        padding: EdgeInsets.only(bottom: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'MAUSAM'.toUpperCase(),
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.orange,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bem Vindo!',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Jorge Danilo'.toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
