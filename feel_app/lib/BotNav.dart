import 'package:flutter/material.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("How do you"),
              new Text("Feel"),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image (
                        image: new AssetImage("graphics/bear1.png"),
                      height: 48.0,
                      width: 48.0
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear2.png"),
                      height: 48.0,
                      width: 48.0
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear3.png"),
                      height: 48.0,
                      width: 48.0
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear4.png"),
                      height: 48.0,
                      width: 48.0
                    ),
                  ],
                ),
              ),
              new Text("Today?")
            ],
          )
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