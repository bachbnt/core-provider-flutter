import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/services/repository.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/widgets/custom_toast.dart';

class SignInModel extends BaseModel {
  final AuthService _authService = AuthService.instance;
  final Repository _repository = Repository.instance;
  String email;
  String password;
  String error;

  Future<bool> signIn() async {
    setState(ViewState.Busy);
    try {
      bool success = await _authService.signIn(email, password);
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
