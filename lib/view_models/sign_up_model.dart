import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

class SignUpModel extends BaseModel {
  final AuthService _authService = AuthService.instance;
  String email;
  String firstName;
  String lastName;
  String password;
  String confirmationPassword;
  String error;

  Future<bool> signUp() async {
    setState(ViewState.Busy);
    try {
      final bool success =
          await _authService.signUp(email, password, firstName, lastName);
      setState(ViewState.Idle);
      if (success)
        print(AppStrings.successMessage);
      else
        print(AppStrings.failureMessage);
      return success;
    } catch (e) {
      error = e.toString();
      setState(ViewState.Idle);
      print(AppStrings.failureMessage);
      return false;
    }
  }
}
