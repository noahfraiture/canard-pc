import 'package:canardpc/profile_out_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'font.dart';

class ProfileInPage extends StatefulWidget {
  const ProfileInPage({super.key});

  @override
  ProfileInPageState createState() => ProfileInPageState();
}

// Extends notifier
class ProfileInPageState extends State<ProfileInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              // Empty space
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO : notify parent
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ProfileOutPage()));
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
        ],
      ),
    );
  }
}
