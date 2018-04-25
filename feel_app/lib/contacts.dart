import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';
import 'package:feel_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel - Resources"),
        ),
        body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                new Text(
                    'Resources',
                style: new TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: FeelColors.peach[700])
                ),
                new Text(" "),
                new Text(
                  'ALBERTA',
                  style: new TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
        ),
                  ),

                new Text(
                    'Mental Health Helpine',
                    style: new TextStyle(
                        fontFamily: 'Dosis',
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                        color: FeelColors.peach[700])),
                new FlatButton(
                    onPressed: _launchURL,
                    child: new Text("1-877-303-2642 (24/7)")),
                new Text(
                    'Crisis/Distress Lines',
                        style: new TextStyle(
                    fontFamily: 'Dosis',
                  fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: FeelColors.peach[700]
                ),
                ),
                new Text("Edmonton"),
                new Text("Distress Line: 780-482-HELP (4357)"),
                new Text("Crisis Response Team: 780-342-7777"),
                new Text("  "),
                new Text("Calgary"),
                new Text("ConnectTeen: 403-264-TEEN (8336)"),
                new Text("Distress Centre Calgary: 403-266-HELP (4357)"),
                new Text("  "),
                new Text(
                  'BC, ALBERTA and SASK also use',
                  style: new TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Text(
                  '811',
                  style: new TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                      color: FeelColors.peach[700]
                  ),
                ),
              ]
          )
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 4)
            );
  }
}
_launchURL() async {
  const url = 'tel:<1-403-299-7878>';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}