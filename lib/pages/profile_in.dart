import 'package:canardpc/pages/profile_out_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../font.dart';

class ProfileInPage extends StatefulWidget {
  const ProfileInPage({super.key});

  @override
  ProfileInPageState createState() => ProfileInPageState();
}

class ProfileInPageState extends State<ProfileInPage> {
  final User? _user = FirebaseAuth.instance.currentUser; // Store user info

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Allow content to scroll
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // User avatar (replace with actual image fetching)
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage('https://placeimg.com/640/480/people'), // Placeholder image
            ),
            const SizedBox(height: 20),

            // User information (adapt to your user data structure)
            if (_user != null) ...[
              Text(
                _user.displayName ?? 'No name',
                style: getPrimaryTextStyle(context),
              ),
              const SizedBox(height: 10),
              Text(_user!.email!),
            ] else ...[
              const Text('No user information available'),
            ],

            const SizedBox(height: 20),

            // Logout button
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut().then((_) {}).catchError((e) {
                  Fluttertoast.showToast(msg: e.toString());
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: Text(
                'Logout',
                style: mediumButtonTextStyle(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
