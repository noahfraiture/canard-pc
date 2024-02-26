import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends ChangeNotifier {
  static final User _singleton = User._internal();
  User._internal();
  factory User() {
    return _singleton;
  }

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  // TODO : could add loading circle
  void login(String username, String password) {
    if (_isConnected) throw Exception("Already connected");
    // Use firebase auth to try a connection
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) => _isConnected = true)
        .catchError((error) => throw Exception(error));
    notifyListeners();
  }

  void logout() {
    if (!_isConnected) throw Exception("Not connected");
    FirebaseAuth.instance.signOut();
    _isConnected = false;
    notifyListeners();
  }
}
