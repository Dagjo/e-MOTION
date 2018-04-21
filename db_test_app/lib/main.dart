import 'package:flutter/material.dart';
import 'package:db_test_app/feel_datasource.dart';
import 'package:db_test_app/journal_entry.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  FeelDataSource _dataSource;

  List<JournalEntry> _journalEntries = new List<JournalEntry>();

  _MyHomePageState() {
    _dataSource = FeelDataSource();
    _dataSource.getJournalEntries().then((entries) {
      setState(() {
        _journalEntries = entries != null ? entries : new List<JournalEntry>();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
          (_journalEntries[index] != null)
              ? new JournalEntryItem(_journalEntries[index],
                  onDelete: () {
                    _deleteJournalEntry(_journalEntries[index]);
                  })
              : null,
        itemCount: _journalEntries.length,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _writeJournalEntry,
        child: new Icon(Icons.edit),
      ),
    );
  }

  _deleteJournalEntry(JournalEntry entry) {
    _dataSource.deleteJournalEntry(entry);
    setState(() {
      _journalEntries.remove(entry);
    });
  }

  _writeJournalEntry() {
    JournalEntry entry = new JournalEntry("blah blub bloo");
    _dataSource.saveJournalEntry(entry);
    setState(() {
      _journalEntries.insert(0, entry);
    });
  }
}

class JournalEntryItem extends StatelessWidget {
  const JournalEntryItem(this.entry, {this.onDelete});

  final VoidCallback onDelete;
  final JournalEntry entry;

  Widget _buildTiles(JournalEntry item) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            title: new Text(entry.created.toString()),
            subtitle: new Text(entry.body),
            leading: new Icon(Icons.format_quote),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
