import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/forgot_password_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/base_view_2.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_activity_indicator.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_button.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IOSForgotPasswordView extends StatefulWidget {
  @override
  _IOSForgotPasswordViewState createState() => _IOSForgotPasswordViewState();
}

class _IOSForgotPasswordViewState extends State<IOSForgotPasswordView> {
  final GlobalKey _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return BaseView2<ForgotPasswordModel, ValidationModel>(
        model1: ForgotPasswordModel(),
        model2: ValidationModel(),
        builder: (BuildContext context, ForgotPasswordModel forgotPasswordModel,
            ValidationModel validationModel, _) {
          return Scaffold(
            key: _globalKey,
            body: _buildView(context, forgotPasswordModel, validationModel),
          );
        });
  }

  Widget _buildView(
      BuildContext context,
      ForgotPasswordModel forgotPasswordModel,
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
              child: forgotPasswordModel.viewState == ViewState.Busy
                  ? IOSActivityIndicator()
                  : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IOSTextField(
                    hintText:
                    '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                    errorText: validationModel.email.error,
                    controller: TextEditingController(
                        text: forgotPasswordModel.email),
                    onChanged: (String value) {
                      forgotPasswordModel.email = value;
                      validationModel.onEmailChanged(value);
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IOSButton(
                        title:
                        '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.confirm))}',
                        onPressed: () async {
                          if (validationModel.isValidResettingPassword(
                              forgotPasswordModel
                                  .email)) if (await forgotPasswordModel
                              .resetPassword())
                            Navigator.of(context)
                                .pushReplacementNamed(signInRoute);
                        },
                      ),
                      IOSButton(
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
