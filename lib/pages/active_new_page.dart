import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/pages/drawer_list.dart';
import 'package:sua_carteira_investimentos/widgets/app_bar.dart';
import 'package:sua_carteira_investimentos/widgets/footer_form.dart';
import 'package:sua_carteira_investimentos/widgets/header_form.dart';

class ActiveNewPage extends StatefulWidget {
  @override
  _ActiveNewPageState createState() => _ActiveNewPageState();
}

class _ActiveNewPageState extends State<ActiveNewPage> {
  double screenHeight;
  List<String> timeInvestments = ['Longo', 'Curto', 'Médio'];
  String itemSelected = "Longo";
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(title: "Novo ativo", showActions: false),
      drawer: DrawerList(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              lowerHalf(context),
              upperHalf(context),
              activeForm(context),
            ],
          )
        ],
      ),
    );
  }

  Widget activeForm(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Novo Ativo",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome do Ativo",
                      hasFloatingPlaceholder: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Descrição do Ativo",
                      hasFloatingPlaceholder: true,
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                        items : timeInvestments.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: ( String newItem) {
                          _dropDownItemSelected(newItem);
                          setState(() {
                            this.itemSelected =  newItem;
                          });
                        },
                        value: itemSelected
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor pago no Ativo",
                      hasFloatingPlaceholder: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      enabled: false,
                      labelText: "Valor Total",
                      hasFloatingPlaceholder: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text('Salvar'),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _dropDownItemSelected(String newItem){
    setState(() {
      this.itemSelected = newItem;
    });
  }
}
