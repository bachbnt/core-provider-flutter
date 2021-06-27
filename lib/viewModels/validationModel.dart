import 'package:bach_flutter_app/viewModels/baseModel.dart';

class ValidationItem {
  ValidationItem({this.value, this.error});

  final String value;
  final String error;
}

class ValidationModel extends BaseModel {
  ValidationItem _email = ValidationItem();
  ValidationItem _firstName = ValidationItem();
  ValidationItem _lastName = ValidationItem();
  ValidationItem _password = ValidationItem();
  ValidationItem _confirmationPassword = ValidationItem();
  ValidationItem _phone = ValidationItem();

  ValidationItem get email => _email;

  ValidationItem get firstName => _firstName;

  ValidationItem get lastName => _lastName;

  ValidationItem get password => _password;

  ValidationItem get confirmPassword => _confirmationPassword;

  ValidationItem get phone => _phone;

  void onEmailChanged(String value) {
    _email = ValidationItem(value: value);
  }

  void onFirstNameChanged(String value) {
    _firstName = ValidationItem(value: value);
  }

  void onLastNameChanged(String value) {
    _lastName = ValidationItem(value: value);
  }

  void onPasswordChanged(String value) {
    _password = ValidationItem(value: value);
  }

  void onConfirmPasswordChanged(String value) {
    _confirmationPassword = ValidationItem(value: value);
  }

  void onPhoneChanged(String value) {
    _phone = ValidationItem(value: value);
  }

  bool isValidSignIn(String email, String password) {
    if (email == null || email.isEmpty) {
      _email = ValidationItem(error: 'Email must not be empty');
      notifyListeners();
      return false;
    } else if (!email.contains('@')) {
      _email = ValidationItem(value: email, error: 'Invalid email format');
      notifyListeners();
      return false;
    } else if (password == null || password.isEmpty) {
      _password = ValidationItem(error: 'Password must not be empty');
      notifyListeners();
      return false;
    } else if (password.length < 6) {
      _password = ValidationItem(
          value: password, error: 'Password must be at least 6 characters');
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }

  bool isValidForgotPassword(String email) {
    if (email == null || email.isEmpty) {
      _email = ValidationItem(error: 'Email must not be empty');
      notifyListeners();
      return false;
    } else if (!email.contains('@')) {
      _email = ValidationItem(value: email, error: 'Invalid email format');
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }

  bool isValidSignUp(String email, String firstName, String lastName,
      String password, String confirmPassword) {
    if (email == null || email.isEmpty) {
      _email = ValidationItem(error: 'Email must not be empty');
      notifyListeners();
      return false;
    } else if (!email.contains('@')) {
      _email = ValidationItem(value: email, error: 'Invalid email format');
      notifyListeners();
      return false;
    } else if (firstName == null || firstName.isEmpty) {
      _firstName = ValidationItem(error: 'First name must not be empty');
      notifyListeners();
      return false;
    } else if (lastName == null || lastName.isEmpty) {
      _lastName = ValidationItem(error: 'Last name must not be empty');
      notifyListeners();
      return false;
    } else if (password == null || password.isEmpty) {
      _password = ValidationItem(error: 'Password must not be empty');
      notifyListeners();
      return false;
    } else if (password.length < 6) {
      _password = ValidationItem(
          value: password, error: 'Password must be at least 6 characters');
      notifyListeners();
      return false;
    } else if (confirmPassword == null || confirmPassword.isEmpty) {
      _confirmationPassword =
          ValidationItem(error: 'Confirm password must not be empty');
      notifyListeners();
      return false;
    } else if (confirmPassword.length < 6) {
      _confirmationPassword = ValidationItem(
          value: confirmPassword,
          error: 'Confirm password must be at least 6 characters');
      notifyListeners();
      return false;
    } else if (confirmPassword != password) {
      _password = ValidationItem(
          value: password,
          error: 'Password and confirm password are not match');
      _confirmationPassword = ValidationItem(
          value: confirmPassword,
          error: 'Password and confirm password are not match');
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }
}
