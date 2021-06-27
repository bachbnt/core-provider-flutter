import 'package:bach_flutter_app/constants/appImage.dart';
import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:bach_flutter_app/viewModels/signInModel.dart';
import 'package:bach_flutter_app/viewModels/validationModel.dart';
import 'package:bach_flutter_app/views/baseView2.dart';
import 'package:bach_flutter_app/widgets/appButton.dart';
import 'package:bach_flutter_app/widgets/appInput.dart';
import 'package:bach_flutter_app/widgets/appSpinner.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BaseView2<SignInModel, ValidationModel>(
        model1: SignInModel(),
        model2: ValidationModel(),
        builder: (context, signInModel, validationModel, _) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Scaffold(
                body: _buildView(context, signInModel, validationModel),
              ),
              signInModel.loading ? AppSpinner() : Container()
            ],
          );
        });
  }

  Future<void> onSignIn(
      SignInModel signInModel, ValidationModel validationModel) async {
    if (validationModel.isValidSignIn(
        signInModel.email, signInModel.password)) {
      Function onSuccess =
          () => Navigator.of(context).pushReplacementNamed(RouteName.home);
      // await signInModel.signIn(onSuccess);
      onSuccess();
    }
  }

  Widget _buildView(BuildContext context, SignInModel signInModel,
      ValidationModel validationModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.width / 24, right: ScreenUtil.width / 24),
        child: Column(
          children: <Widget>[
            SizedBox(
                width: ScreenUtil.width / 2,
                child: Image(image: AssetImage(AppImage.logo))),
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
                      signInModel.email = value.trim();
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
                      signInModel.password = value.trim();
                      validationModel.onPasswordChanged(value.trim());
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      title: '${ScreenUtil.t(I18nKey.forgotPassword)}',
                      onPressed: () => Navigator.of(context)
                          .pushNamed(RouteName.forgotPassword),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 12,
                  ),
                  AppButton(
                      title: '${ScreenUtil.t(I18nKey.signIn)}',
                      onPressed: () => onSignIn(signInModel, validationModel)),
                  AppButton(
                    title: '${ScreenUtil.t(I18nKey.signUp)}',
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RouteName.signUp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
