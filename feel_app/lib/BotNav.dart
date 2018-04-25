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
              new Text("How do you",
              style: new TextStyle(
              fontFamily: 'Dosis',
              fontSize:48.0,
              fontWeight: FontWeight.bold,
              )
              ),
              new Text('Feel',
              style: new TextStyle(
                  fontFamily: 'Dosis',
              fontSize:72.0,
              fontWeight: FontWeight.bold,
              color: FeelColors.peach[900])),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new FlatButton(
                        onPressed: () { onImagePressed(context); },
                        child: new Image (
                          image: new AssetImage("graphics/bear2.png"),
                          height: 55.0,
                          width: 55.0,
                        )
                    ),
                    new FlatButton(
                        onPressed: () { onImagePressed(context); },
                        child: new Image (
                          image: new AssetImage("graphics/bear2.png"),
                          height: 55.0,
                          width: 55.0,
                        )
                    ),
                    new FlatButton(
                        onPressed: () { onImagePressed(context); },
                        child: new Image (
                          image: new AssetImage("graphics/bear3.png"),
                          height: 55.0,
                          width: 55.0,
                        )
                    ),
                    new FlatButton(
                        onPressed: () { onImagePressed(context); },
                        child: new Image (
                          image: new AssetImage("graphics/bear4.png"),
                          height: 55.0,
                          width: 55.0,
                        )
                    ),
                  ],
                ),
              ),
              new Text("Today?",
                  style: new TextStyle(
                      fontFamily: 'Dosis',
                      fontSize:48.0,
                      fontWeight: FontWeight.bold,
                      )
              )
            ],
          )
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 0)
    );
  }

  onImagePressed(BuildContext context) {
    showDialog(context: context,
        child: new AlertDialog(title: new Text("Thank you for your feedback!")));
  }

}