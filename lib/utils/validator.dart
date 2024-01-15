class Validator {
  static String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String regexMobile = r"^\d{10}$";

  static bool validateEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }
}
