import 'package:flutter/material.dart';

class DoawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Felipe Martins da Silva"),
              accountEmail: Text("felipe@visionar.io"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/felipe.png")
              ),
            ),
            FlutterLogo(size:50),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("ListView"),
              subtitle: Text("Lista de Itens"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("ListView");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Ajuda"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Help");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Ajuda"),
              subtitle: Text("Sair"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Exit");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
