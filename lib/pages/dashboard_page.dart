import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sua_carteira_investimentos/model/active.dart';
import 'package:sua_carteira_investimentos/model/time_of_investiment.dart';
import 'package:sua_carteira_investimentos/pages/drawer_list.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
  List<Active> actives = [];
  _populeDasboard() {
    for (int i = 0; i <= 10; i++) {
      actives.add(Active(id: i, name: "VVAR${i}F", quantity: i+1, unitaryValue: 16.0, amount: 100, timeInvestment: TimeInvestment.LONG));
    }
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    widget._populeDasboard();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: ListView.builder(
        itemCount: widget.actives.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 1,
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.timeline),
                title: Text(widget.actives[index].name),
                subtitle: Text("Configure seu aplicativo aqui"),
//              trailing: Icon(Icons.apps),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }

}
