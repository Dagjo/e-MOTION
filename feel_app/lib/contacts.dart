import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';

class ContactsWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                new Text("Mental Health Helpline"),
                new Text("1-877-303-2642 (24/7)"),
                new Text("  "),
                new Text("Crisis/Distress Lines"),
                new Text("Edmonton: 780-482-4357; 780-342-7777"),
                new Text("Calgary: 403-266-HELP (4357)"),
                new Text("  "),
                new Text
              ]
          )
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 4)
            );
  }
}