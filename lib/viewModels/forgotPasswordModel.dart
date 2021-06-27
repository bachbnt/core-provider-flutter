import 'package:bach_flutter_app/constants/constant.dart';
import 'package:bach_flutter_app/models/reqres/forgotPassword.dart';
import 'package:bach_flutter_app/services/authService.dart';
import 'package:bach_flutter_app/utils/toast.dart';
import 'package:bach_flutter_app/viewModels/baseModel.dart';

class ForgotPasswordModel extends BaseModel {
  final AuthService _authService = AuthService.instance();
  String email;
  String password;

  Future<void> forgotPassword() async {
    setLoading(true);
    try {
      ForgotPasswordRes res =
          await _authService.forgotPassword(ForgotPasswordReq(email: email));
      if (res.status == 200) {
        Toast.success(message: Constant.success);
      } else {
        Toast.error(message: Constant.failure);
      }
    } catch (e) {
      print(e.toString());
      Toast.error(message: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
