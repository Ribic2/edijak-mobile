import 'package:edijak_mobile/pages/login.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ListView(
              children: [
                Text("Dobrodošel " + storage.getItem('user')["name"] + " " + storage.getItem('user')["surname"])
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Domov'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('sporočila'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Odjavi se'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}
