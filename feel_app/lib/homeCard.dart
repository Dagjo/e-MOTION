import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("How do you"),
          new Text("Feel"),
          new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image (
                  image: new AssetImage("graphics/bear1.png")
                ),
                new Image (
                  image: new AssetImage("graphics/bear2.png")
                ),
                new Image (
                  image: new AssetImage("graphics/bear3.png")
                ),
                new Image (
                  image: new AssetImage("graphics/bear4.png")
                ),
              ],
            ),
          ),
          new Text("Today?")
        ],
      ),
    );
  }
}
