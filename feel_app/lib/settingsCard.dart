import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {

  final String title;

  SettingsCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text("Place settings on this page"),
      )
    );
  }
}

