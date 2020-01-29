class RegisterValidator {
  String usernameValidator(String value) {
    if (value.length == 0) {
      return "Kullanıcı Adı boş olamaz";
    } else
      return null;
  }
  String passwordValidator(String value) {
    if (value.length == 0) {
      return "Şifre boş olamaz";
    } else
      return null;
  }
  String countryValidator(String value) {
    if (value.length == 0) {
      return "Ülke boş olamaz";
    } else
      return null;
  }
  String cityValidator(String value) {
    if (value.length == 0) {
      return "Şehir boş olamaz";
    } else
      return null;
  }
  String firstNameValidator(String value) {
    if (value.length == 0) {
      return "Ad boş olamaz";
    } else
      return null;
  }
  String lastNameValidator(String value) {
    if (value.length == 0) {
      return "Soyad boş olamaz";
    } else
      return null;
  }
  String emailValidator(String value) {
    if (value.length == 0) {
      return "Email boş olamaz";
    } else
      return null;
  }

}