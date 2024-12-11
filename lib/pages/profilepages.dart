import 'package:cinema_application/pages/accountflow/accountsetup.dart';
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
        preferredSize: const Size.fromHeight(64),
        child: MainPagesBar(title: 'Profile'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: _isLoggedIn ? loginAccount(context) : notLogin(context),
        ),
      ),
    );
  }

  Widget notLogin(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Button and Text Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 240, 224),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color.fromARGB(255, 14, 37, 34),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(1, 2),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text
                Text(
                  "You're not logged in. Set up your account to access personalized features and manage your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //Login Button
                const SizedBox(height: 24),
                SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          // color: Colors.black.withOpacity(0.2),
                          offset: Offset(1, 2),
                          // blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Accountsetup()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 255, 196, 64), // Warna tombol
                        foregroundColor:
                            Color.fromARGB(255, 14, 37, 34), // Warna teks
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Color.fromARGB(255, 14, 37, 34), // Tambahkan border
                            width: 1.2,
                          ),
                        ),
                        elevation: 0, // Set elevation ke 0 untuk menghindari shadow default
                      ),
                      child: const Text(
                        'Setup Account',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
