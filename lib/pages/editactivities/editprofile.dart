import 'dart:io';

import 'package:cinema_application/pages/accountflow/db_accounthelper.dart';
import 'package:cinema_application/pages/dbhelper.dart';
import 'package:cinema_application/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool _isLoggedIn = false; // Track login state
  Map<String, dynamic>? _userDetails; // Store user details
  File? image;
  String? profileimagepath;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    loadPicture();
  }

  Future<void> loadPicture() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      profileimagepath = pref.getString('profile_image');
    });
  }

  Future<void> pickPicture(ImageSource source) async {
    final pickFile = await ImagePicker().pickImage(source: source);
    if (pickFile != null) {
      setState(() {
        image = File(pickFile.path);
        profileimagepath = pickFile.path;
      });
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('profile_image', pickFile.path);
    }
  }

  void showimage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Take a Photo'),
            onTap: () {
              Navigator.of(context).pop();
              pickPicture(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Choose from Gallery'),
            onTap: () {
              Navigator.of(context).pop();
              pickPicture(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
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
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture with Edit Icon
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Stack(
              alignment:
                  Alignment.bottomRight, // Align the icon to bottom-right
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profileimagepath != null
                      ? FileImage(File(profileimagepath!))
                      : AssetImage('assets/images/pngwing.com.png')
                          as ImageProvider,
                ),
                // Edit Icon
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: showimage,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xffA7D4CB),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 4),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 16), // Space between the picture and the text
          // Name
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "${_userDetails?['name'] ?? 'User'}",
                  style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.2),
                ),
                Text(
                  _userDetails != null
                      ? _userDetails!['email']
                      : 'Email not available',
                  style: TextStyle(
                      fontFamily: 'Montserrat-Medium',
                      fontSize: 15,
                      color: Color(0xff6A958C)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
