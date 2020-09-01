import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/widgets/custom_toast.dart';

class SignUpModel extends BaseModel {
  final AuthService _authService = AuthService.instance;
  String email;
  String firstName;
  String lastName;
  String password;
  String confirmPassword;
  String error;

  Future<bool> signUp() async {
    setState(ViewState.Busy);
    try {
      bool success =
          await _authService.signUp(email, password, firstName, lastName);
      setState(ViewState.Idle);
      if (success)
        CustomToast.showSuccessToast('Success');
      else
        CustomToast.showFailureToast('Failure');
      return success;
    } catch (e) {
      error = e.toString();
      setState(ViewState.Idle);
      CustomToast.showFailureToast('Failure $error');
      return false;
    }
  }
}
