import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';
import 'theme.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Feel - Home")),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("How do you",
                style: new TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 48.0,
                )),
            new Text('Feel',
                style: new TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                    color: FeelColors.peach[900])),
            new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        onImage1Pressed(context);
                      },
                      child: new Image(
                        image: new AssetImage("graphics/bear1.png"),
                        height: 55.0,
                        width: 55.0,
                      )),
                  new FlatButton(
                      onPressed: () {
                        onImage2Pressed(context);
                      },
                      child: new Image(
                        image: new AssetImage("graphics/bear2.png"),
                        height: 55.0,
                        width: 55.0,
                      )),
                  new FlatButton(
                      onPressed: () {
                        onImage3Pressed(context);
                      },
                      child: new Image(
                        image: new AssetImage("graphics/bear3.png"),
                        height: 55.0,
                        width: 55.0,
                      )),
                  new FlatButton(
                      onPressed: () {
                        onImage4Pressed(context);
                      },
                      child: new Image(
                        image: new AssetImage("graphics/bear4.png"),
                        height: 55.0,
                        width: 55.0,
                      )),
                ],
              ),
            ),
            new Text(" "),
            new Text("Today?",
                style: new TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 48.0,
                ))
          ],
        )),
        bottomNavigationBar: new FeelNavigationBar(currentIndex: 0));
  }

  onImage1Pressed(BuildContext context) {
    showDialog(
        context: context,
        child:
        new AlertDialog(title: new Text("Awesome! Consider recording something in your journal.")));
  }
  onImage2Pressed(BuildContext context) {
    showDialog(
        context: context,
        child:
        new AlertDialog(title: new Text("Cool! Consider recording something in your journal.")));
  }
  onImage3Pressed(BuildContext context) {
    showDialog(
        context: context,
        child:
        new AlertDialog(title: new Text("Want to talk about it? Journal so you can remember.")));
  }
  onImage4Pressed(BuildContext context) {
    showDialog(
        context: context,
        child:
        new AlertDialog(title: new Text("Want to talk about it? Check the Resources or try a Journal entry.")));
  }
}
