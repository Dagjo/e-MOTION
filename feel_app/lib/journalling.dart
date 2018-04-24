import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';

class JournallingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0)
              return createCard (asset: "graphics/bear1.png", title: "Journal entry one", subtitle: "Today was a good day. I spent a lot of time with my friends.");
            if (index == 1)
              return createCard (asset: "graphics/bear4.png", title: "Journal entry two", subtitle: "Today was a bad day. A bully punched me.");
                }),
              bottomNavigationBar: new FeelNavigationBar(currentIndex: 1));
  }
  Card createCard({asset: String, title: String, subtitle: String}){
    return new Card(
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Image(
                  image: new AssetImage(asset),
                  height: 48.0,
                  width: 48.0,
                ),
                title: new Text(title),
                subtitle: new Text(subtitle),
              ),
              new ButtonTheme.bar(
                  child: new ButtonBar(
                      children: <Widget>[
                        new IconButton(
                            icon: new Icon(Icons.delete)
                        ),
                      ]
                  ))
            ])
    );
  }
}
