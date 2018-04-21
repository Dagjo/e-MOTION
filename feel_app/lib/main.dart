import 'package:flutter/material.dart';
import 'package:feel_app/settingsCard.dart';
import 'package:feel_app/BotNav.dart';
import 'package:feel_app/theme.dart';
import 'package:feel_app/journalling.dart';
import 'package:feel_app/tracking.dart';
import 'package:feel_app/medication.dart';
import 'package:feel_app/contacts.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Feel',
      theme: feelThemeData,
      home: new ScaffoldWithBottomNavigation(),
      routes: <String, WidgetBuilder> {
        '/settings': (BuildContext context) => new SettingsCard(title: 'Feel settings'),
        '/journalling': (BuildContext context) => new JournallingWidget(),
        '/tracking': (BuildContext context) => new TrackingWidget(),
        '/medication': (BuildContext context) => new MedicationWidget(),
        '/contacts': (BuildContext context) => new ContactsWidget(),

      },
    );
  }
}


