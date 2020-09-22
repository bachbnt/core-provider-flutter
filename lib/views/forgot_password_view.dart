import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/forgot_password_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/multi_base_view.dart';
import 'package:bach_flutter_app/widgets/material/custom_flat_button.dart';
import 'package:bach_flutter_app/widgets/material/app_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/material/custom_raised_button.dart';
import 'package:bach_flutter_app/widgets/material/custom_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return MultiBaseView<ForgotPasswordModel, ValidationModel>(
        model1: ForgotPasswordModel(),
        model2: ValidationModel(),
        builder: (BuildContext context, ForgotPasswordModel forgotPasswordModel,
            ValidationModel validationModel, _) {
          return Scaffold(
            key: _key,
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
                width: ScreenHelper.orientation == Orientation.portrait
                    ? ScreenHelper.screenHeight / 2
                    : ScreenHelper.screenWidth / 2,
                child: const Image(image: AssetImage(AppImages.logoImage))),
            Expanded(
              child: forgotPasswordModel.viewState == ViewState.Busy
                  ? AppProgressIndicator()
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
                            forgotPasswordModel.email = value;
                            validationModel.onEmailChanged(value);
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomRaisedButton(
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
                            CustomFlatButton(
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
