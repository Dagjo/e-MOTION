import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';
import 'theme.dart';
class ScaffoldWithBottomNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel")
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("How do you"),
              new Text('Feel',
              style: new TextStyle(
                  fontFamily: 'Dosis',
              fontSize:32.0,
              fontWeight: FontWeight.bold,
              color: FeelColors.peach[900])),
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
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 0)
    );
  }

  onImagePressed(BuildContext context) {
    showDialog(context: context,
        child: new AlertDialog(title: new Text("Image Pressed")));
  }

}