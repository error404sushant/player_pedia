class AppValidator{



  //region Validate email
  static String? validateEmail({required String? email}) {
    //If email is null or empty
    if (email == null || email.isEmpty) {
      return "Please enter email";
    }
    // Regular expression pattern for email validation
    final emailPattern = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    // Check if the email matches the pattern
    if (!emailPattern.hasMatch(email)) {
      return "Please enter valid email";
    }
    return null;
  }
  //endregion



//region ValidatePassword
  static String? validatePassword({required String? password}) {
    // If password is null or empty
    if (password == null || password.isEmpty) {
      return "Please enter password";
    }
    // Check if password length is less than 6 characters
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    // Regular expression pattern for password validation
    final upperCasePattern = RegExp(r'[A-Z]'); // At least one uppercase letter
    final numberPattern = RegExp(r'\d');      // At least one number
    final specialCharPattern = RegExp(r'[!@#$%^&*(),.?":{}|<>]'); // At least one special character

    if (!upperCasePattern.hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!numberPattern.hasMatch(password)) {
      return "Password must contain at least one number";
    }
    if (!specialCharPattern.hasMatch(password)) {
      return "Password must contain at least one special character";
    }

    return null; // Password is valid
  }
//endregion

//endregion



}