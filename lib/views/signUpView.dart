import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:bach_flutter_app/viewModels/signUpModel.dart';
import 'package:bach_flutter_app/viewModels/validationModel.dart';
import 'package:bach_flutter_app/views/baseView2.dart';
import 'package:bach_flutter_app/widgets/appButton.dart';
import 'package:bach_flutter_app/widgets/appInput.dart';
import 'package:bach_flutter_app/widgets/appSpinner.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BaseView2<SignUpModel, ValidationModel>(
      model1: SignUpModel(),
      model2: ValidationModel(),
      builder: (BuildContext context, signUpModel, validationModel, _) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Scaffold(
              body: _buildView(context, signUpModel, validationModel),
            ),
            signUpModel.loading ? AppSpinner() : Container()
          ],
        );
      },
    );
  }

  Future<void> onSignUp(
      SignUpModel signUpModel, ValidationModel validationModel) async {
    if (validationModel.isValidSignUp(
        signUpModel.email,
        signUpModel.firstName,
        signUpModel.lastName,
        signUpModel.password,
        signUpModel.confirmPassword)) {
      Function onSuccess =
          () => Navigator.of(context).pushReplacementNamed(RouteName.home);
      await signUpModel.signUp(onSuccess);
    }
  }

  Widget _buildView(BuildContext context, SignUpModel signUpModel,
      ValidationModel validationModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.width / 24, right: ScreenUtil.width / 24),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppInput(
                    hintText: '${ScreenUtil.t(I18nKey.email)}',
                    errorText: validationModel.email.error,
                    controller: TextEditingController(
                        text: validationModel.email.value),
                    onChanged: (String value) {
                      signUpModel.email = value.trim();
                      validationModel.onEmailChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 48,
                  ),
                  AppInput(
                    obscureText: true,
                    hintText: '${ScreenUtil.t(I18nKey.password)}',
                    errorText: validationModel.password.error,
                    controller: TextEditingController(
                        text: validationModel.password.value),
                    onChanged: (String value) {
                      signUpModel.password = value.trim();
                      validationModel.onPasswordChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 48,
                  ),
                  AppInput(
                    obscureText: true,
                    hintText: '${ScreenUtil.t(I18nKey.confirmPassword)}',
                    errorText: validationModel.confirmPassword.error,
                    controller: TextEditingController(
                        text: validationModel.confirmPassword.value),
                    onChanged: (String value) {
                      signUpModel.confirmPassword = value.trim();
                      validationModel.onConfirmPasswordChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 48,
                  ),
                  AppInput(
                    obscureText: true,
                    hintText: '${ScreenUtil.t(I18nKey.firstName)}',
                    errorText: validationModel.firstName.error,
                    controller: TextEditingController(
                        text: validationModel.firstName.value),
                    onChanged: (String value) {
                      signUpModel.firstName = value.trim();
                      validationModel.onPasswordChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 48,
                  ),
                  AppInput(
                    obscureText: true,
                    hintText: '${ScreenUtil.t(I18nKey.lastName)}',
                    errorText: validationModel.lastName.error,
                    controller: TextEditingController(
                        text: validationModel.lastName.value),
                    onChanged: (String value) {
                      signUpModel.lastName = value.trim();
                      validationModel.onPasswordChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 12,
                  ),
                  AppButton(
                      title: '${ScreenUtil.t(I18nKey.signUp)}',
                      onPressed: () => onSignUp(signUpModel, validationModel)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
