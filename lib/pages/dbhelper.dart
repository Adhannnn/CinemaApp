import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  // Private constructor
  DatabaseHelper._internal();

  static Database? _database;

  // Get the database (combined logic)
  Future<Database> get database async {
    if (_database != null) return _database!;

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'example.db');

    // Check if database exists
    bool dbExists = await File(path).exists();
    if (dbExists) {
      print("Database already exists at $path");
    } else {
      print("Creating new database at $path");
    }

    // Open or create the database
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            age INTEGER NOT NULL
          )
        ''');
        print("Database and table created");
      },
    );

    return _database!;
  }

  // Close the database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
