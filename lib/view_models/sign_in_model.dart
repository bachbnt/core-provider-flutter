import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/models/user.dart';
import 'package:bach_flutter_app/services/auth_service.dart';
import 'package:bach_flutter_app/services/repository.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

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
      if (success) {
        _repository.currentUser = User(
            firstName: 'Bách', lastName: 'Bùi', email: 'bachbnt@gmail.com');
        print(AppStrings.successMessage);
      } else
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
