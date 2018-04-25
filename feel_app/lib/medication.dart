import 'package:feel_app/feel_navigation_bar.dart';
import 'package:flutter/material.dart';

class MedicationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Feel - Medication Alerts"),
        ),
        body: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
          if (index == 0)
            return new ListTile(
                leading: new Icon(Icons.access_alarm),
                title: new Text("Take noon medication."),
                subtitle: new Text("Paroxitene 30mg"));
          if (index == 1)
            return new ListTile(
                leading: new Icon(Icons.access_alarm),
                title: new Text("Take evening medication."),
                subtitle: new Text("Bupropion 300mg"));
        }),
        bottomNavigationBar: new FeelNavigationBar(currentIndex: 3));
  }
}
