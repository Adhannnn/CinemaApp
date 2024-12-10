import 'package:cinema_application/pages/accountflow/db_accounthelper.dart';
import 'package:cinema_application/pages/dbhelper.dart';
import 'package:cinema_application/widgets/mainpagesbar.dart';
import 'package:flutter/material.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  bool _isLoggedIn = false; // Track login state
  Map<String, dynamic>? _userDetails; // Store user details

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    // Fetch the last logged-in account from the login table
    String? lastLoginEmail = await AccountHelper().getLastLoginAccount();

    if (lastLoginEmail != null) {
      // Fetch user details from the users table
      final user = await DatabaseHelper().getUserByEmail(lastLoginEmail);
      if (user != null) {
        setState(() {
          _isLoggedIn = true;
          _userDetails = user;
        });
        return;
      }
    }

    // If no account is logged in or no user details found
    setState(() {
      _isLoggedIn = false;
      _userDetails = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 247),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: MainPagesBar(title: 'Profile'),
      ),
      body: SafeArea(
        child: Container(
          child: _isLoggedIn ? loginAccount(context) : notLogin(context),
        ),
      ),
    );
  }

  Widget notLogin(BuildContext context) {
    return Center(
      child: Text(
        "Not logged in yet.",
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ),
    );
  }

  Widget loginAccount(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome, ${_userDetails?['name'] ?? 'User'}!",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Email: ${_userDetails?['email'] ?? ''}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            "Phone: ${_userDetails?['phoneNumber'] ?? ''}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

}
