import 'package:bach_flutter_app/constants/constant.dart';
import 'package:bach_flutter_app/models/reqres/signIn.dart';
import 'package:bach_flutter_app/services/authService.dart';
import 'package:bach_flutter_app/utils/toast.dart';
import 'package:bach_flutter_app/viewModels/baseModel.dart';

class SignInModel extends BaseModel {
  final AuthService _authService = AuthService.instance();
  String email;
  String password;

  Future<void> signIn(Function onSuccess) async {
    setLoading(true);
    try {
      SignInRes res = await _authService
          .signIn(SignInReq(email: email, password: password));
      if (res.status == 200) {
        Toast.success(message: Constant.success);
        onSuccess();
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
