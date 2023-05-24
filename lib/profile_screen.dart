import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_vanguard/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(child: Text('Welcome to your Profile Page')),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () => {FirebaseAuth.instance.signOut()},
                    child: Text('Sign Out!'))
              ],
            ),
          ]),
    );
  }
}
