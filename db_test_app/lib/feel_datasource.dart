import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:db_test_app/feel_database.dart';
import 'package:db_test_app/journal_entry.dart';

class FeelDataSource {

  String _databasePath;

  /// Create, and Open, a feel database
  /// By default the database is stored in the Application Documents Directory
  /// and is named 'feel.db'.
  Future<FeelDatabase> openDatabase() async {

    // If we don't have a path to the database we'll use the default.
    if (_databasePath == null) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      _databasePath = join(documentsDirectory.path, "feel.db");
    }

    FeelDatabase feelDatabase = FeelDatabase(_databasePath);
    await feelDatabase.open();
    return feelDatabase;
  }

  /// Get a list of the entries in the journal from the database.
  Future<List<JournalEntry>> getJournalEntries() async {
    FeelDatabase db;
    try {
      db = await openDatabase();
      List<Map> entries = await db.readJournalEntries();

      if (entries == null)
        return new List<JournalEntry>();

      List<JournalEntry> list = new List<JournalEntry>();
      for(Map entry in entries)
        list.add(JournalEntry.fromMap(entry));
      return list;
    }
    catch (e) {
      throw new Exception("Failed to get journal entries: ${e.toString()}");
    }
    finally {
      db?.close();
    }
  }

  /// Delete a journal entry from the database.
  deleteJournalEntry(JournalEntry journalEntry) async {
    FeelDatabase db;
    try {
      db = await openDatabase();
      await db.deleteJournalEntry(journalEntry.created.millisecondsSinceEpoch);
    }
    catch (e) {
      throw new Exception("Failed to delete journal entry: ${e.toString()}");
    }
    finally {
      db?.close();
    }
  }

  /// Save a new journal entry in the database.
  saveJournalEntry(JournalEntry journalEntry) async {
    FeelDatabase db;
    try {
      db = await openDatabase();
      await db.insertJournalEntry(journalEntry.created.millisecondsSinceEpoch, journalEntry.body);
    }
    catch (e) {
      throw new Exception("Failed to save journal entry: ${e.toString()}");
    }
    finally {
      db?.close();
    }
  }
}