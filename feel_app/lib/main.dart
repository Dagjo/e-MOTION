import 'package:flutter/material.dart';
import 'package:feel_app/homeCard.dart';
import 'package:feel_app/settingsCard.dart';
import 'package:feel_app/BotNav.dart';
import 'package:feel_app/theme.dart';
import 'package:feel_app/journalling.dart';
import 'package:feel_app/tracking.dart';
import 'package:feel_app/medication.dart';
import 'package:feel_app/conacts.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _currentCard = new HomeCard();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: _openSettings,
          )
        ],
      ),
      body: _currentCard,
    );
  }

  void _openSettings() {
    setState((){
        Navigator.of(context).pushNamed("/settings");
        });
  }
}

