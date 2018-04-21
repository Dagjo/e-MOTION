import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:db_test_app/feel_database.dart';
import 'package:test/test.dart';
import 'package:flutter/services.dart';

void main() {

  MethodChannel channel = const MethodChannel('plugins.flutter.io/path_provider');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return Path.current + '/temp';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('Create the database', () async {
    String path = await getDefaultFeelDatabasePath();
    File file = new File(path);
    if (file.existsSync())
      file.deleteSync();

    FeelDatabase database = FeelDatabase(path);
    database.open();
    List<Map> entries = await database.readJournalEntries();
    expect(entries, isNotNull);
    expect(entries.length, equals(0));
  });
}