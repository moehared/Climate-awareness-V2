extension PhoneNumberValidator on String {
  bool isValidPhoneNumber() {
    return RegExp(
            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
        .hasMatch(this);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r'^[a-zA-Z0-9_\-=@,\.;\$&\+:#|<>*!%\^\()\{}\[]\?]+$')
        .hasMatch(this);
  }
}

extension UrlValidator on String {
  //check if from a black list
  //check if it has right syntax

  bool isValidUrl() {
    return RegExp(
            "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
        .hasMatch(this);
  }
}

bool validateUserInput(String input) {
  return int.tryParse(input) != null;
}
