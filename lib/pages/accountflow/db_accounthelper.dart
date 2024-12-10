import 'package:cinema_application/pages/dbhelper.dart';

class AccountHelper {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<bool> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
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
