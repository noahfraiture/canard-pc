class FormController {
  static final RegExp _emailRegexExp =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");

  static final RegExp _passwordRegexExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");

  static bool validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    return _emailRegexExp.hasMatch(email);
  }

  static bool validatePassword(String password) {
    if (password.isEmpty) {
      return false;
    }
    return _passwordRegexExp.hasMatch(password);
  }
}
