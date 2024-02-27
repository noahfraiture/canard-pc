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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  // TODO : very similar to register, could be merged or kept separate for clarity
  Future signIn() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        )
        .then((value) => setState(() {
              isLoading = false;
              Navigator.pop(context);
            }))
        .catchError((e) => {
              setState(() {
                isLoading = false;
                Fluttertoast.showToast(msg: e.toString());
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),

              // Email field
              const Text(
                'Email',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: _emailController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Password field
              const Text(
                'Password',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: _passwordController,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Sign in button
              ElevatedButton(
                onPressed: signIn,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: isLoading ? const CircularProgressIndicator() : const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
