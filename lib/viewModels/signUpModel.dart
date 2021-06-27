import 'package:bach_flutter_app/constants/constant.dart';
import 'package:bach_flutter_app/models/reqres/signUp.dart';
import 'package:bach_flutter_app/services/authService.dart';
import 'package:bach_flutter_app/utils/toast.dart';
import 'package:bach_flutter_app/viewModels/baseModel.dart';

class SignUpModel extends BaseModel {
  final AuthService _authService = AuthService.instance();
  String email;
  String firstName;
  String lastName;
  String password;
  String confirmPassword;

  Future<void> signUp(Function onSuccess) async {
    setLoading(true);
    try {
      SignUpRes res = await _authService.signUp(SignUpReq(
          email: email,
          firstName: firstName,
          lastName: lastName,
          password: password));
      if (res.status == 200) {
        Toast.success(message: Constant.success);
        onSuccess();
      } else {
        Toast.error(message: Constant.failure);
      }
    } catch (e) {
      Toast.error(message: e.toString());
      return false;
    } finally {
      setLoading(false);
    }
  }
}
