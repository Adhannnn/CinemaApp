import 'package:cinema_application/pages/accountflow/db_accounthelper.dart';
import 'package:flutter/material.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  String? _lastLoginUser;
  @override
  void initState() {
    super.initState();
    _loadLastLoginUser();
  }


  void _loadLastLoginUser() async {
  String? lastLogin = await AccountHelper().getLastLoginAccount();
  print("Last login user: $lastLogin"); // Print to see what it returns
  setState(() {
    _lastLoginUser = lastLogin ?? "No user logged in yet.";
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Status"),
      ),
      body: Center(
        child: Text(
          "Last Logged In User: $_lastLoginUser",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}