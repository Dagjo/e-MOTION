import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("How do you"),
          new Text('Feel',
          style: new TextStyle(fontFamily: 'Dosis'),
          ),
          new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton (
                  child: new Image(image: new AssetImage("graphics/bear1.png")),
                  onPressed: onImagePressed(context),
                ),
                new RaisedButton (
                child: new Image(image: new AssetImage("graphics/bear2.png"))
                ),
                new RaisedButton (
                child: new Image(image: new AssetImage("graphics/bear3.png"))
                ),
                new RaisedButton (
                child: new Image(image: new AssetImage("graphics/bear4.png"))
                ),
              ],
            ),
          ),
          new Text("Today?")
        ],
      ),
    );
  }

  onImagePressed(BuildContext context) {
    showDialog(context: context,
        child: new AlertDialog(title: new Text("Image Pressed")));
  }


}
