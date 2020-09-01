import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/utils/screen_util.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/sign_up_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/multi_base_view.dart';
import 'package:bach_flutter_app/widgets/custom_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/custom_raised_button.dart';
import 'package:bach_flutter_app/widgets/custom_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    return MultiBaseView<SignUpModel, ValidationModel>(
      model1: SignUpModel(),
      model2: ValidationModel(),
      builder: (BuildContext context, SignUpModel signUpModel,
          ValidationModel validationModel, _) {
        return Scaffold(
          key: _key,
          body: _buildView(context, signUpModel, validationModel),
        );
      },
    );
  }

  Widget _buildView(BuildContext context, SignUpModel signUpModel,
      ValidationModel validationModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtils.screenWidth / 24,
            right: ScreenUtils.screenWidth / 24),
        child: OrientationSwitch(
          children: <Widget>[
            SizedBox(
                width: ScreenUtils.orientation == Orientation.portrait
                    ? ScreenUtils.screenHeight / 2
                    : ScreenUtils.screenWidth / 2,
                child: Image.asset(AppImages.logo)),
            Expanded(
              child: signUpModel.viewState == ViewState.Busy
                  ? CustomProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                          errorText: validationModel.email.error,
                          controller: TextEditingController(
                              text: validationModel.email.value),
                          onChanged: (String value) {
                            signUpModel.email = value.trim();
                            validationModel.onEmailChanged(value.trim());
                          },
                        ),
                        CustomTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.firstName))}',
                          errorText: validationModel.firstName.error,
                          controller: TextEditingController(
                              text: validationModel.firstName.value),
                          onChanged: (value) {
                            signUpModel.firstName = value.trim();
                            validationModel.onFirstNameChanged(value.trim());
                          },
                        ),
                        CustomTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.lastName))}',
                          errorText: validationModel.lastName.error,
                          controller: TextEditingController(
                              text: validationModel.lastName.value),
                          onChanged: (value) {
                            signUpModel.lastName = value.trim();
                            validationModel.onLastNameChanged(value.trim());
                          },
                        ),
                        CustomTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.password))}',
                          errorText: validationModel.password.error,
                          controller: TextEditingController(
                              text: validationModel.password.value),
                          onChanged: (value) {
                            signUpModel.password = value.trim();
                            validationModel.onPasswordChanged(value.trim());
                          },
                        ),
                        CustomTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.confirmationPassword))}',
                          errorText: validationModel.confirmationPassword.error,
                          controller: TextEditingController(
                              text: validationModel.confirmationPassword.value),
                          onChanged: (value) {
                            signUpModel.confirmPassword = value.trim();
                            validationModel
                                .onConfirmationPasswordChanged(value.trim());
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomRaisedButton(
                              title:
                                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signUp))}',
                              onPressed: () async {
                                if (validationModel.isValidSigningUp(
                                    signUpModel.email,
                                    signUpModel.firstName,
                                    signUpModel.lastName,
                                    signUpModel.password,
                                    signUpModel
                                        .confirmPassword)) if (await signUpModel
                                    .signUp())
                                  Navigator.of(context)
                                      .pushReplacementNamed(signInRoute);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.back))}'),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
