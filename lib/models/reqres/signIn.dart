import 'package:bach_flutter_app/models/reqres/base.dart';
import 'package:bach_flutter_app/models/token.dart';

class SignInReq extends BaseReq {
  String email;
  String password;

  SignInReq({this.email, this.password});
}

class SignInRes extends BaseRes {
  Token data;

  SignInRes({this.data, int status, String message})
      : super(status: status, message: message);
}
