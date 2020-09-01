import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/widgets/custom_toast.dart';

class ForgotPasswordModel extends BaseModel {
  final AuthService _authService = AuthService.instance;
  String email;
  String error;

  Future<bool> resetPassword() async {
    setState(ViewState.Busy);
    try {
      bool success = await _authService.resetPassword(email);
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
