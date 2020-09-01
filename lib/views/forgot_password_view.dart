import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/utils/screen_util.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/forgot_password_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/multi_base_view.dart';
import 'package:bach_flutter_app/widgets/custom_flat_button.dart';
import 'package:bach_flutter_app/widgets/custom_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/custom_raised_button.dart';
import 'package:bach_flutter_app/widgets/custom_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    return MultiBaseView<ForgotPasswordModel, ValidationModel>(
      model: ForgotPasswordModel(),
      model2: ValidationModel(),
      onModelReady: (model) async {},
      builder: (context, forgotPasswordModel, validationModel, _) => Scaffold(
        key: _key,
        body: _buildView(context, forgotPasswordModel, validationModel),
      ),
    );
  }

  Widget _buildView(
      BuildContext context,
      ForgotPasswordModel forgotPasswordModel,
      ValidationModel validationModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtils.screenWidth / 24,
            right: ScreenUtils.screenWidth / 24),
        child: OrientationSwitch(
          children: [
            SizedBox(
                width: ScreenUtils.orientation == Orientation.portrait
                    ? ScreenUtils.screenHeight / 2
                    : ScreenUtils.screenWidth / 2,
                child: Image(image: AssetImage(AppImages.logo))),
            Expanded(
              child: forgotPasswordModel.viewState == ViewState.Busy
                  ? CustomProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                          errorText: validationModel.email.error,
                          controller: TextEditingController(
                              text: validationModel.email.value),
                          onChanged: (value) {
                            forgotPasswordModel.email = value;
                            validationModel.onEmailChanged(value);
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
