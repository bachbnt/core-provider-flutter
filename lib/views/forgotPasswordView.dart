import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:bach_flutter_app/viewModels/forgotPasswordModel.dart';
import 'package:bach_flutter_app/viewModels/validationModel.dart';
import 'package:bach_flutter_app/views/baseView2.dart';
import 'package:bach_flutter_app/widgets/appButton.dart';
import 'package:bach_flutter_app/widgets/appInput.dart';
import 'package:bach_flutter_app/widgets/appSpinner.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BaseView2<ForgotPasswordModel, ValidationModel>(
        model1: ForgotPasswordModel(),
        model2: ValidationModel(),
        builder: (context, forgotPasswordModel, validationModel, _) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Scaffold(
                body: _buildView(context, forgotPasswordModel, validationModel),
              ),
              forgotPasswordModel.loading ? AppSpinner() : Container()
            ],
          );
        });
  }

  Future<void> onForgotPassword(ForgotPasswordModel forgotPasswordModel,
      ValidationModel validationModel) async {
    if (validationModel.isValidForgotPassword(
      forgotPasswordModel.email,
    )) {
      await forgotPasswordModel.forgotPassword();
    }
  }

  Widget _buildView(
      BuildContext context,
      ForgotPasswordModel forgotPasswordModel,
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
                      forgotPasswordModel.email = value.trim();
                      validationModel.onEmailChanged(value.trim());
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil.height / 12,
                  ),
                  AppButton(
                      title: '${ScreenUtil.t(I18nKey.forgotPassword)}',
                      onPressed: () => onForgotPassword(
                          forgotPasswordModel, validationModel)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
