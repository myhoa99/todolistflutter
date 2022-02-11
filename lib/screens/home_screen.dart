import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:todolistappflutter/helpers/drawer_navigation.dart';
import 'package:todolistappflutter/helpers/home_page.dart';
import 'package:todolistappflutter/screens/todo_screen.dart';

import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String page = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ToDo List',style: TextStyle(fontSize: 24,color: Colors.black),),
      ),
      drawer: DrawerNavigaton(),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'home':
              return HomePage();
            case 'category':
              return CategoriesScreen();
            case 'search':
              return Container(color: Colors.red.shade50);
            case 'user':
              return Container(color: Colors.yellow);
            default:
              return HomePage();

          }

        },
      ),
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(
              id: 'home',
              icon: Icons.dashboard,
              title: 'Home'
          ),
          PandaBarButtonData(
              id: 'category',
              icon: Icons.event_available,
              title: 'Category'
          ),
          PandaBarButtonData(
              id: 'search',
              icon: Icons.search,
              title: 'Search'
          ),
          PandaBarButtonData(
              id: 'user',
              icon: Icons.person,
              title: 'User'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoScreen()),
          );
        },
      ),
    );

  }
}
