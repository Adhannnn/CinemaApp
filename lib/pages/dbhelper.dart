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
    String path = join(dbPath, 'cinemaapp.db');

    print("Database path: $path");

    try {
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
        readOnly: false, // Set to false for write operations
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              email TEXT NOT NULL UNIQUE,
              password TEXT NOT NULL,
              phoneNumber TEXT NOT NULL UNIQUE,
              created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
              profile_image BLOB
            );
          ''');
          print("Database and table created");
        },
      );
    } catch (e) {
      print("Error opening or creating database: $e");
    }

    return _database!;
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    try {
      final db = await database;
      final result = await db.insert('users', user);
      print("User inserted with id: $result"); // Add this print statement
      return result;
    } catch (e) {
      print("Error inserting user: $e");
      return -1; // Return -1 to indicate failure
    }
  }

  // Get all users
  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }

  // Update a user
  Future<int> updateUser(int id, Map<String, dynamic> user) async {
    final db = await database;
    return await db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  // Delete a user
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Close the database
  Future<void> close() async {
    final db = await database;
    await db.close();
    print("Database closed.");
  }
}
