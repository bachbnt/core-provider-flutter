import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/sign_in_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/base_view_2.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_activity_indicator.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_button.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IOSSignInView extends StatefulWidget {
  @override
  _IOSSignInViewState createState() => _IOSSignInViewState();
}

class _IOSSignInViewState extends State<IOSSignInView> {
  final GlobalKey _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return BaseView2<SignInModel, ValidationModel>(
        model1: SignInModel(),
        model2: ValidationModel(),
        onModelReady: (signInModel, _) {
          signInModel.email = 'bachbnt@gmail.com';
          signInModel.password = '123456';
        },
        builder: (BuildContext context, SignInModel signInModel,
            ValidationModel validationModel, _) {
          return Scaffold(
            key: _globalKey,
            body: _buildView(context, signInModel, validationModel),
          );
        });
  }

  Widget _buildView(BuildContext context, SignInModel signInModel,
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
              child: signInModel.viewState == ViewState.Busy
                  ? IOSActivityIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IOSTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                          errorText: validationModel.email.error,
                          controller: TextEditingController(
                              text: signInModel.email),
                          onChanged: (String value) {
                            signInModel.email = value.trim();
                            validationModel.onEmailChanged(value.trim());
                          },
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight / 48,
                        ),
                        IOSTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.password))}',
                          errorText: validationModel.password.error,
                          controller: TextEditingController(
                              text: signInModel.password),
                          onChanged: (String value) {
                            signInModel.password = value.trim();
                            validationModel.onPasswordChanged(value.trim());
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IOSButton(
                            title:
                                '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.forgotPassword))}?',
                            onPressed: () => Navigator.of(context)
                                .pushNamed(forgotPasswordRoute),
                          ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight / 12,
                        ),
                        IOSButton(
                          title:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signIn))}',
                          onPressed: () async {
                            if (validationModel.isValidSigningIn(
                                signInModel.email,
                                signInModel
                                    .password)) if (await signInModel.signIn())
                              Navigator.of(context)
                                  .pushReplacementNamed(mainRoute);
                          },
                        ),
                        IOSButton(
                          title:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signUp))}',
                          onPressed: () =>
                              Navigator.of(context).pushNamed(signUpRoute),
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
