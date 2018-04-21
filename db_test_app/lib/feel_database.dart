import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<String> getDefaultFeelDatabasePath() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  return join(documentsDirectory.path, 'feel.db');
}

class FeelDatabase {

  String _databasePath;
  Database _database;

  /// Versioning the database allows us to perform upgrades on the database
  /// if we have to change its schema for some reason.
  final int _version = 1;

  /// SQL statement for creating the journal entry table.
  /// The date and time that the journal entry was created is used as the
  /// primary key for the table. Primary keys have to be unique, which means
  /// we won't allow multiple journal entries for the exact same date and time.
  /// The database creates an index from the primary keys. An index allows
  /// for quick searching on the values indexed (in this case when the
  /// journal entry was created, so we can find entries quickly by date.)
  static const String _journalEntryTableCreationSql =
      'CREATE TABLE JournalEntry (Created INTEGER PRIMARY KEY, Body TEXT)';

  /// SQL statement for getting all the journal entry records
  /// The results are ordered by time created, in descending order
  /// so we can easily display the most recent entries at the top of our list.
  static const String _journalEntrySelectAllSql =
      'SELECT Created, Body FROM JournalEntry ORDER BY Created DESC';

  /// SQL statement for inserting a record into the journal entry table.
  /// There are two ways to write a SQL statement, one is to use the values
  /// in the statement directly, e.g.
  ///     INSERT INTO JournalEntry (Created, Body)
  ///            VALUES (234342566, "This is my journal entry")
  /// The other way is to use a 'parameterized' statement, which doesn't
  /// use the values directly in the SQL statement, but passes a statement with
  /// placeholders and values for the placeholders to the database for execution.
  /// Using parameterized queries is strongly recommended, it allows the
  /// database to cache the execution plan for the query, and it prevents
  /// a hacker from performing SQL Injection attacks against your application.
  static const String _journalEntryInsertSql =
      'INSERT INTO JournalEntry (Created, Body) VALUES (?, ?)';

  /// SQL statement for deleting a record from the journal entry table
  /// (Also parameterized.)
  static const String _journalEntryDeleteSql =
      'DELETE FROM JournalEntry WHERE Created = ?';

  FeelDatabase(this._databasePath);

  /// Open the database.
  /// If the database does not exist yet, it will be created and initialized.
  open() async {
    if (_database != null)
      throw new Exception('Database is already open');

    _database = await openDatabase(_databasePath,
        version: _version,
        onCreate: _initializeDatabase);
  }

  /// Close the database.
  /// An open database consumes system resources, such as memory.
  /// An application running on a server with lots of resources, that will
  /// access the database frequently, might opt to keep the connections open so
  /// it can run more queries in the same amount of time (since creating a
  /// connection takes time.)
  /// An app like ours, running on a mobile device with limited resources, which
  /// will only access the database infrequently would opt to close the
  /// connection so more resources are available to the other apps.
  close() async {
    if (_database != null)
      return await _database.close();
  }

  /// Initialize the database with a version appropriate schema.
  _initializeDatabase(Database db, int version) async {
    // When creating the db, create the tables we need
    if (version == 1)
      return await db.execute(_journalEntryTableCreationSql);

    throw new Exception("Initializing Database, unknown version: $version");
  }

  /// Read all the records from the journal entry table.
  Future<List<Map>> readJournalEntries() async {
    return await _database.rawQuery(_journalEntrySelectAllSql);
  }

  /// Insert a record into the journal entry table.
  insertJournalEntry(int created, String body) async {
    return await _database.rawInsert(_journalEntryInsertSql, [created, body]);
  }

  /// Delete a record from the journal entry table.
  deleteJournalEntry(int created) async {
    return await _database.rawInsert(_journalEntryDeleteSql, [created]);
  }
}