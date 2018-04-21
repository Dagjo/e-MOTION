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
                      height: 75.0,
                      width: 75.0,
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear2.png"),
                      height: 75.0,
                      width: 75.0,
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear3.png"),
                      height: 75.0,
                      width: 75.0,
                    ),
                    new Image (
                        image: new AssetImage("graphics/bear4.png"),
                      height: 75.0,
                      width: 75.0,
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
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem (
            icon: new IconButton(icon: new Icon(Icons.home),
        onPressed: () => Navigator.of(context).pushNamed("/")),
            title: new Text("Home")
        ),
    new BottomNavigationBarItem (
    icon: new IconButton(icon: new Icon (Icons.book),
        onPressed: () => Navigator.of(context).pushNamed("/journalling")),
    title: new Text("Journal")
    ),
    new BottomNavigationBarItem (
    icon: new IconButton(icon: new Icon (Icons.favorite),
    onPressed: () => Navigator.of(context).pushNamed("/tracking")),
    title: new Text("Tracking")
    ),
    new BottomNavigationBarItem (
    icon: new IconButton(icon: new Icon (Icons.healing),
    onPressed: () => Navigator.of(context).pushNamed("/medication"),),
    title: new Text("Med")
    ),
    new BottomNavigationBarItem (
    icon: new IconButton(icon: new Icon (Icons.chat),
    onPressed: () => Navigator.of(context).pushNamed ("/contacts")),
    title: new Text("Contacts")

    ),

        ])
    );
  }

  onImagePressed(BuildContext context) {
    showDialog(context: context,
        child: new AlertDialog(title: new Text("Image Pressed")));
  }

}