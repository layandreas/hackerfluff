import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Necessary for code-generation to work
part 'db_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> database(DatabaseRef ref) async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'hacker.db');

  // Delete the database
  await deleteDatabase(path);

  // open the database
  Database db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'create table if not exists comments (id integer primary key, comment_was_seen integer)');
  });

  return db;
}
