import 'package:canardpc/profile_in_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // form with an email and a password field to register
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  Future signIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      isLoading = false;
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email field
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _emailController,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Entrez votre email',
            ),
          ),
          // Password field
          const Text(
            'Mot de passe',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _passwordController,
            cursorColor: Colors.black,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Entrez votre mot de passe',
            ),
          ),
          // Register button
          ElevatedButton(
            onPressed: () {
              signIn();
              // Pop and tell to replace the route with profileIn instead of profileOut
              Navigator.pop(context);
              // TODO notify main to replace page
            },
            child: isLoading ? const CircularProgressIndicator() : const Text('Sign in'),
          ),
        ],
      ),
    );
  }
}