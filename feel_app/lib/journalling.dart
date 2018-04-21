import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';

class JournallingWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
            child: new Text("This is for Journalling")
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 1)
            );
  }
}