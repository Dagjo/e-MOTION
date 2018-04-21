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
          child: new Text("Your contacts"),
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 4)
            );
  }
}