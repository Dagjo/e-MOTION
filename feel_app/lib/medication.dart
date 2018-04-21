import 'package:flutter/material.dart';

class MedicationWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
          child: new Text("Your medication reminders"),
        ),
        bottomNavigationBar:
        new BottomNavigationBar(
            currentIndex: 3,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem (
                  icon: new IconButton(icon: new Icon(Icons.home),
                      onPressed: () => Navigator.of(context).pushNamed("/")),
                  title: new Text("Home")
              ),
              new BottomNavigationBarItem (
                  icon: new IconButton(icon: new Icon (Icons.book),
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/journalling")),
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