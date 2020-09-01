import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/utils/screen_util.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/sign_in_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/multi_base_view.dart';
import 'package:bach_flutter_app/widgets/custom_flat_button.dart';
import 'package:bach_flutter_app/widgets/app_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/custom_raised_button.dart';
import 'package:bach_flutter_app/widgets/custom_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBaseView<SignInModel, ValidationModel>(
      model1: SignInModel(),
      model2: ValidationModel(),
      onModelReady: (_, __) async {},
      builder: (BuildContext context,SignInModel signInModel,ValidationModel validationModel, _) => Scaffold(
        key: _key,
        body: _buildView(context, signInModel, validationModel),
      ),
    );
  }

  Widget _buildView(BuildContext context, SignInModel signInModel,
      ValidationModel validationModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.screenWidth / 24,
            right: ScreenUtil.screenWidth / 24),
        child: OrientationSwitch(
          children: [
            SizedBox(
                width: ScreenUtil.orientation == Orientation.portrait
                    ? ScreenUtil.screenHeight / 2
                    : ScreenUtil.screenWidth / 2,
                child: Image(image: AssetImage(AppImages.logoImage))),
            Expanded(
              child: signInModel.viewState == ViewState.Busy
                  ? AppProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.email))}',
                          errorText: validationModel.email.error,
                          controller: TextEditingController(
                              text: validationModel.email.value),
                          onChanged: (value) {
                            signInModel.email = value.trim();
                            validationModel.onEmailChanged(value.trim());
                          },
                        ),
                        SizedBox(
                          height: ScreenUtil.screenHeight / 48,
                        ),
                        CustomTextField(
                          obscureText: true,
                          hintText:
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.password))}',
                          errorText: validationModel.password.error,
                          controller: TextEditingController(
                              text: validationModel.password.value),
                          onChanged: (value) {
                            signInModel.password = value.trim();
                            validationModel.onPasswordChanged(value.trim());
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomFlatButton(
                            title:
                                '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.forgotPassword))}?',
                            onPressed: () => Navigator.of(context)
                                .pushNamed(forgotPasswordRoute),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.screenHeight / 12,
                        ),
                        CustomRaisedButton(
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
                        FlatButton(
                          child: Text(
                              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signUp))}'),
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
