import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';

class TrackingWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new Center(
                child: new Image (
                  image: new AssetImage("graphics/themoodgraph.png"),
                  height: 350.0,
                  width: 350.0,
                )
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 2)
            );
  }
}