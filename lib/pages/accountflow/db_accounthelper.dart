import 'package:cinema_application/pages/dbhelper.dart';

class AccountHelper {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<bool> loginUser(
      {required String email, required String password}) async {
    final db =
        await dbHelper.database; // Assuming you're accessing the database here

    // Query to find the user by email and check if password matches
    final result = await db.query(
      'users', // Replace with your actual table name
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    // If any record is found, return true, otherwise false
    return result.isNotEmpty;
  }

  Future<bool> registerUser({
    String? fullName,
    required String email,
    required String password,
    String? phoneNumber,
  }) async {
    // Check if the email is already registered
    final existingUser = await dbHelper.getUserByEmail(email);
    if (existingUser != null) {
      return false; // Email already exists
    }

    // Add the user to the database
    final newUser = {
      'name': fullName,
      'email': email,
      'password': password, // Ensure password hashing for security
      'phoneNumber': phoneNumber,
    };

    await dbHelper.insertUser(newUser);
    return true; // Registration successful
  }
}
