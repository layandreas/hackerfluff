import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';

// Necessary for code-generation to work
part 'db_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> database(DatabaseRef ref) async {
  late String path;

  if (kIsWeb) {
    // Change default factory on the web
    databaseFactory = databaseFactoryFfiWeb;
    path = 'my_web_web.db';
  } else {
    final databasesPath = await getLibraryDirectory();
    path = join(databasesPath.path, 'hacker.db');
  }

  log('Database path is: $path');

  // open the database
  Database db = await openDatabase(path, version: 2,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    log('Creating table "comments"');
    await db.execute(
        'create table if not exists comments (id integer primary key, story_id integer, comment_was_seen integer)');
    await db.execute(
        'create table if not exists settings (setting_name text primary key, settings_json string)');
    await db.execute(
        'create table if not exists bookmarks (id integer primary key, title text, insert_time timestamp default current_timestamp)');
  });

  return db;
}
