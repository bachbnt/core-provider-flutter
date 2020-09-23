import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/sign_up_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/base_view_2.dart';
import 'package:bach_flutter_app/widgets/material/android_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/material/android_flat_button.dart';
import 'package:bach_flutter_app/widgets/material/android_raised_button.dart';
import 'package:bach_flutter_app/widgets/material/android_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AndroidSignUpView extends StatefulWidget {
  @override
  _AndroidSignUpViewState createState() => _AndroidSignUpViewState();
}

class _AndroidSignUpViewState extends State<AndroidSignUpView> {
  final GlobalKey _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return BaseView2<SignUpModel, ValidationModel>(
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
            left: ScreenHelper.screenWidth / 24,
            right: ScreenHelper.screenWidth / 24),
        child: OrientationSwitch(
          children: <Widget>[
            SizedBox(
                width: ScreenHelper.isPortrait()
                    ? ScreenHelper.screenHeight / 2
                    : ScreenHelper.screenWidth / 2,
                child: const Image(image: AssetImage(AppImages.logoImage))),
            Expanded(
              child: signUpModel.viewState == ViewState.Busy
                  ? AndroidCircularProgress()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AndroidTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                          errorText: validationModel.email.error,
                          controller:
                              TextEditingController(text: signUpModel.email),
                          onChanged: (String value) {
                            signUpModel.email = value.trim();
                            validationModel.onEmailChanged(value.trim());
                          },
                        ),
                        AndroidTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.firstName))}',
                          errorText: validationModel.firstName.error,
                          controller: TextEditingController(
                              text: signUpModel.firstName),
                          onChanged: (String value) {
                            signUpModel.firstName = value.trim();
                            validationModel.onFirstNameChanged(value.trim());
                          },
                        ),
                        AndroidTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.lastName))}',
                          errorText: validationModel.lastName.error,
                          controller:
                              TextEditingController(text: signUpModel.lastName),
                          onChanged: (String value) {
                            signUpModel.lastName = value.trim();
                            validationModel.onLastNameChanged(value.trim());
                          },
                        ),
                        AndroidTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.password))}',
                          errorText: validationModel.password.error,
                          controller:
                              TextEditingController(text: signUpModel.password),
                          onChanged: (String value) {
                            signUpModel.password = value.trim();
                            validationModel.onPasswordChanged(value.trim());
                          },
                        ),
                        AndroidTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.confirmationPassword))}',
                          errorText: validationModel.confirmationPassword.error,
                          controller: TextEditingController(
                              text: signUpModel.confirmationPassword),
                          onChanged: (String value) {
                            signUpModel.confirmationPassword = value.trim();
                            validationModel
                                .onConfirmationPasswordChanged(value.trim());
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            AndroidRaisedButton(
                              title:
                                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signUp))}',
                              onPressed: () async {
                                if (validationModel.isValidSigningUp(
                                    signUpModel.email,
                                    signUpModel.firstName,
                                    signUpModel.lastName,
                                    signUpModel.password,
                                    signUpModel
                                        .confirmationPassword)) if (await signUpModel
                                    .signUp())
                                  Navigator.of(context)
                                      .pushReplacementNamed(signInRoute);
                              },
                            ),
                            AndroidFlatButton(
                              title:
                                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.back))}',
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
