import 'package:flutter/material.dart';
import 'package:feel_app/feel_navigation_bar.dart';
import 'package:feel_app/theme.dart';

class ContactsWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel"),
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
                new Text (" "),
                new Text(" "),
                new Text(
                  'Alberta',
                  style: new TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: FeelColors.peach[700]
        ),
                  ),

                new Text(
                    'Mental Health Helpine',
                    style: new TextStyle(
                        fontFamily: 'Dosis',
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                        color: FeelColors.peach[700])),
                new Text("1-877-303-2642 (24/7)"),
                new Text("  "),
                new Text(
                    'Crisis/Distress Lines',
                        style: new TextStyle(
                    fontFamily: 'Dosis',
                  fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: FeelColors.peach[700]
                ),
                ),
                new Text("Edmonton: 780-482-4357; 780-342-7777"),
                new Text("Calgary: 403-266-HELP (4357)"),
                new Text("  "),
                new Text("ConnectTeen: text, chat, phone, email"),
                new Text("Distress Centre Calgary: chat, phone, email")
              ]
          )
        ),
        bottomNavigationBar: new FeelNavigationBar (currentIndex: 4)
            );
  }
}