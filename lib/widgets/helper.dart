

/// A collection of common validators that can be reused
class Validators {
  static final emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?)+$",
  );

  static Validator notEmpty({String? fieldName}) {
    return (String? value) {
      return (value!.isEmpty) ? "$fieldName field cannot be empty." : null;
    };
  }

  static Validator fieldNotEmpty() {
    return (String? value) {
      return (value!.isEmpty) ? "field cannot be empty." : null;
    };
  }


  static Validator minLength(int minLength) {
    return (String? value) {
      if ((value!.length) < minLength) {
        return "Must contain a minimum of $minLength characters.";
      }
      return null;
    };
  }

  // static Validator autoPayAmount({num? minimum}) {
  //   if (minimum == null) {
  //     return (_) {
  //       return null;
  //     };
  //   }
  //   return (String? value) {
  //     if (Utility.convertToRealNumber(value ?? "0") > minimum) {
  //       return "Amount can't be higher than ${Utility.currencyConverter(minimum)}";
  //     }
  //     return null;
  //   };
  // }

  static Validator matchPattern(Pattern pattern, [String? patternName]) {
    return (String? value) {
      if ((pattern.allMatches(value!).isEmpty)) {
        return "Please enter a valid ${patternName ?? "value"}.";
      }
      return null;
    };
  }

  static Validator email() {
    return matchPattern(emailPattern, "email");
  }

  static Validator password([int minimumLength = 6]) => multipleAnd([
        containsUpper("Password"),
        containsLower("Password"),
        containsNumber("Password"),
        containsSpecialChar("Password"),
        minLength(minimumLength),
      ], shouldTrim: true);

  static Validator containsUpper([String? fieldName]) {
    return (String? value) {
      if (value!.containsUpper()) return null;
      return "${fieldName ?? 'Field'} must contain at least one uppercase \n character.";
    };
  }


  static Validator comparePasswordAndConfirmPassword(String password) {
    return (String? value) {
      if ((value!.trim()) != password.trim()) {
        return "Does not match new Password";
      }
      return null;
    };
  }


  static Validator comparePasswordAndConfirmPasswordDiff(String password) {
    return (String? value) {
      if ((value!.trim()) == password.trim()) {
        return "Old Password must not be the same as New password";
      }
      return null;
    };
  }


  static Validator containsLower([String? fieldName]) {
    return (String? value) {
      if (value!.containsLower()) return null;
      return "${fieldName ?? 'Field'} must contain at least one lowercase character.";
    };
  }

  static Validator containsNumber([String? fieldName]) {
    return (String? value) {
      if (value!.containsNumber()) return null;
      return "${fieldName ?? 'Field'} must contain at least one number.";
    };
  }



  static Validator containsSpecialChar([String? fieldName]) {
    return (String? value) {
      if (value!.containsSpecialChar()) return null;
      return "${fieldName ?? 'Field'} must contain at least one special character.";
    };
  }

  static Validator containsSpecialChar2([String? fieldName]) {
    return (String? value) {
      // if (value!.containsSpecialChar()) return null;

      if (value!.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return null;
      return "${fieldName ?? 'Field'} must contain at least one special character.";
    };
  }

  /// Creates a validator that if the combination of multiple validators.
  ///
  /// The provided validators are applied in the order in which
  /// they're specified in the list.
  static Validator multipleAnd(List<Validator> validators,
      {bool shouldTrim = true}) {
    return (String? value) {
      value = shouldTrim ? value!.trim() : value;
      for (Validator validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  /// Creates a validator that if the combination of multiple validators.
  ///
  /// The provided validators are applied in the order in which
  /// they're specified in the list.
  static Validator multipleOr(List<Validator> validators,
      {required String message, bool shouldTrim = true}) {
    return (String? value) {
      value = shouldTrim ? value!.trim() : value;
      for (Validator validator in validators) {
        final result = validator(value);
        if (result == null) return result;
      }
      return message;
    };
  }
}

typedef Validator = String? Function(String? value);

extension CharacterValidation on String {
  bool containsUpper() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 65 && code <= 90) return true;
    }
    return false;
  }

  bool containsLower() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 97 && code <= 122) return true;
    }
    return false;
  }

  bool containsSpecialChar() {
    for (var i = 0; i < length; i++) {
      if ("#?!@\$ %^&*-".contains(this[i])) return true;
    }
    return false;
  }

  bool containsNumber() {
    for (var i = 0; i < length; i++) {
      var code = codeUnitAt(i);
      if (code >= 48 && code <= 57) return true;
    }
    return false;
  }

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Name is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validateMobile(String? value) {
    String pattern = r'(^\+?[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Mobile phone number is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Mobile phone number must contain only digits";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if ((value?.length ?? 0) < 6) {
      return 'Password must be more than 5 characters';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Password doesn\'t match';
    } else if (confirmPassword?.isEmpty ?? true) {
      return 'Confirm password is required';
    } else {
      return null;
    }
  }

}

