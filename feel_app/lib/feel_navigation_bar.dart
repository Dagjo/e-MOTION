import 'package:flutter/material.dart';

class FeelNavigationBar extends StatelessWidget {
  final int currentIndex;
FeelNavigationBar ({this.currentIndex}){

}

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
            currentIndex: currentIndex,
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

            ]);
  }
}