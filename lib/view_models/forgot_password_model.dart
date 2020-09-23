import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

class ForgotPasswordModel extends BaseModel {
  final AuthService _authService = AuthService.instance;
  String email;
  String error;

  Future<bool> resetPassword() async {
    setState(ViewState.Busy);
    try {
      final bool success = await _authService.resetPassword(email);
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
