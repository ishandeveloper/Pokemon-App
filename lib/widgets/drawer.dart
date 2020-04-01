import 'package:flutter/material.dart';
import 'package:pokemon_app/Screens/about.dart';

import '../homepage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("ishandeveloper@outlook.com",style:TextStyle(color: Colors.black)),
            accountName: Text("Ishan Sharma",style:TextStyle(fontSize: 24,color: Colors.black)),
            arrowColor: Colors.black,
            onDetailsPressed: (){},
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("http://www.ishandeveloper.com/2020%20[old]/assets/img/profile.JPG"),
              ),
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16),
          child: ListTile(
            leading: Icon(Icons.pages),
            title: Text("Catalogue"),
            subtitle: Text("Info about every pokemon"),
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()
               ));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16),
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
            subtitle: Text("App Creator & Version"),
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()
               ));
            },
          ),
        )
        ],
      ),
      
      );
  }
}