/// A class representing an individual journal entry
class JournalEntry {
  DateTime _created;
  String _body;

  JournalEntry(String body, {DateTime created}) {
    _created = created != null ? created : DateTime.now();
    _body = body;
  }

  JournalEntry.fromMap(Map map) {
    _created = DateTime.fromMillisecondsSinceEpoch(map["Created"], isUtc: true);
    _body = map["Body"];
  }

  DateTime get created => _created;
  String get body => _body;
}