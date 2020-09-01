import 'package:bach_flutter_app/models/user.dart';
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
      final bool success = await _authService.signIn(email, password);
      setState(ViewState.Idle);
      if (success){
        _repository.initUser(User(firstName: 'bach', lastName: 'bui', email: 'fdsf@gmail.com'));
        CustomToast.showCustomToast(
            message: 'Success', toastType: ToastType.Success);
      }
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
