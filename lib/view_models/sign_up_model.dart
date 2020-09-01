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
      final bool success =
          await _authService.signUp(email, password, firstName, lastName);
      setState(ViewState.Idle);
      if (success)
        CustomToast.showCustomToast(
            message: 'Success', toastType: ToastType.Success);
      else
        CustomToast.showCustomToast(
            message: 'Failure', toastType: ToastType.Failure);
      return success;
    } catch (e) {
      error = e.toString();
      setState(ViewState.Idle);
      CustomToast.showCustomToast(
          message: 'Failure $error', toastType: ToastType.Failure);
      return false;
    }
  }
}
