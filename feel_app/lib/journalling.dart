import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';

class JournallingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel - Journal"),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0)
              return createCard (context: context, asset: "graphics/bear1.png", title: "09-16-17", subtitle: "Caleb and I shared the secret of our crushes today. He likes... You thought I'd tell? ;)");
            if (index == 1)
              return createCard (context: context, asset: "graphics/bear1.png", title: "09-14-17", subtitle: "Today was great! My new friend Caleb came I were hanging out when he est of my friends came over and eveyone go along!");
            if (index == 2)
              return createCard (context: context, asset: "graphics/bear2.png", title: "09-12-17", subtitle: "Today was better, I sat with a new kid and now we're friends.");
            if (index == 3)
              return createCard (context: context, asset: "graphics/bear3.png", title: "09-10-17", subtitle: "Today was alright, no one punched me and I'm allowed back in school.");
            if (index == 4)
              return createCard (context: context, asset: "graphics/bear3.png", title: "09-08-17", subtitle: "Today was okay I guess. I forgot my binder at home, and I think my friends were ignoring me.");
            if (index == 5)
              return createCard (context: context, asset: "graphics/bear4.png", title: "09-06-17", subtitle: "Today was a bad day. A bully punched me in the nose. I punched him back. Got suspended.");
                }),
              bottomNavigationBar: new FeelNavigationBar(currentIndex: 1));
  }
  Card createCard({context: BuildContext, asset: String, title: String, subtitle: String}){
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
                          icon: new Icon(Icons.create),
                          onPressed: () => _showAlert(context, title, "Edit")
                        ),
                        new IconButton(
                          icon: new Icon(Icons.delete),
                          onPressed: () => _showAlert(context, title, "Delete")
                        ),
                      ]
                  ))
            ])
    );
  }

  _showAlert(BuildContext context, String title, String text) {
    showDialog(context: context, child: new AlertDialog(
        title: new Text(title),
        content: new Text(text),
      ));
  }
}
