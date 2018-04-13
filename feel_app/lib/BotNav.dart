import 'package:flutter/material.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
          child: new Text("How are you feeling today?"),
        ),
        bottomNavigationBar:
        new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem (
            icon: new Icon(Icons.home),
            title: new Text("Home")
        ),
    new BottomNavigationBarItem (
    icon: new Icon(Icons.book),
    title: new Text("Journal")
    ),
    new BottomNavigationBarItem (
    icon: new Icon(Icons.favorite),
    title: new Text("Tracking")
    ),
    new BottomNavigationBarItem (
    icon: new Icon(Icons.healing),
    title: new Text("Med")
    ),
    new BottomNavigationBarItem (
    icon: new Icon(Icons.chat),
    title: new Text("Contacts")
    ),

        ])
    );
  }
}