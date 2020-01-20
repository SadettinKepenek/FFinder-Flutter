class LoginValidator {
  String usernameValidator(String value) {
    if (value.length == 0) {
      return "Username boş olamaz";
    } else
      return null;
  }
  String passwordValidator(String value) {
    if (value.length == 0) {
      return "Password boş olamaz";
    } else
      return null;
  }
}
