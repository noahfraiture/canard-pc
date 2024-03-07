import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:canardpc/profile/form_controller_class.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _emailError = "";
  bool isLoading = false;
  bool triedOnce = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateEmail() {
    if (_emailController.text.isEmpty) {
      return false;
    }
    return FormController.validateEmail(_emailController.text);
  }

  // Sign in with error handling
  Future<void> signIn() async {
    triedOnce = true;
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 20.0),
                  const Text('Email', style: TextStyle(fontSize: 16.0)),
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
                              borderSide: const BorderSide(color: Colors.transparent)),
                          errorText: triedOnce ? _emailError : ""),
                      onChanged: (value) {
                        if (_validateEmail()) {
                          setState(() => _emailError = "");
                        } else {
                          setState(() => _emailError = _validateEmail() ? '' : 'Invalid email');
                        }
                      }),
                  const SizedBox(height: 20.0),
                  const Text('Password', style: TextStyle(fontSize: 16.0)),
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
                              borderSide: const BorderSide(color: Colors.transparent)))),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () => signIn(),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                      child: isLoading ? const CircularProgressIndicator() : const Text('Sign In')),
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                      child: isLoading ? const CircularProgressIndicator() : const Text('Cancel'))
                ]))));
  }
}
