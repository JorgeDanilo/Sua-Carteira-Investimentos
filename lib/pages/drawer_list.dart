import 'package:flutter/material.dart';
import 'package:sua_carteira_investimentos/helpers/navigator.dart';
import 'package:sua_carteira_investimentos/pages/profile_page.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final String url =
      "https://miro.medium.com/max/1400/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            _header(),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Meus Ativos Favoritos"),
              subtitle: Text("Seus ativos favoritos aqui"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Gerenciar Ativos"),
              subtitle: Text("Gerencie seus ativos aqui"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Rendimentos"),
              subtitle: Text("Visualize seus rendimentos aqui"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configurações"),
              subtitle: Text("Configure seu aplicativo aqui"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Perfil"),
              subtitle: Text("Configure seu perfil aqui"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                push(context, ProfilePage(), replace: false);
              },
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.orange),
      accountName: Text("Jorge Danilo"),
      accountEmail: Text("danilo91519188@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
