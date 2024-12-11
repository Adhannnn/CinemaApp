import 'package:cinema_application/pages/accountflow/db_accounthelper.dart';
import 'package:cinema_application/pages/dbhelper.dart';
import 'package:cinema_application/pages/editactivities/editprofile.dart';
import 'package:cinema_application/widgets/mainpagesbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 35),
          width: 343,
          height: 86,
          decoration: BoxDecoration(
            color: const Color(0xffF5F0E0),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black), // Cleaner border shorthand
          ),
          child: Row(
            children: [
              // Profile Picture
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/pngwing.com.png'),
                ),
              ),
              // Name and Email
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_userDetails?['name'] ?? 'User'}", // Safely access the name
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _userDetails != null
                          ? _userDetails!['email'] ?? 'Email not available'
                          : 'Email not available',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Edit Icon
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Editprofile()));
                  },
                  child: Container(
                    width: 40.34,
                    height: 40.37,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black)),
                        color: Color(0xffA7D4CB),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(offset: Offset(2, 4))]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icon/edit.svg',
                          width: 30.3,
                          height: 30.3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
