import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:bach_flutter_app/view_models/sign_in_model.dart';
import 'package:bach_flutter_app/view_models/validation_model.dart';
import 'package:bach_flutter_app/views/multi_base_view.dart';
import 'package:bach_flutter_app/widgets/material/custom_flat_button.dart';
import 'package:bach_flutter_app/widgets/material/app_progress_indicator.dart';
import 'package:bach_flutter_app/widgets/material/custom_raised_button.dart';
import 'package:bach_flutter_app/widgets/material/custom_text_field.dart';
import 'package:bach_flutter_app/widgets/orientation_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CupertinoSignInView extends StatefulWidget {
  @override
  _CupertinoSignInViewState createState() => _CupertinoSignInViewState();
}

class _CupertinoSignInViewState extends State<CupertinoSignInView> {
  final GlobalKey _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return MultiBaseView<SignInModel, ValidationModel>(
        model1: SignInModel(),
        model2: ValidationModel(),
        builder: (BuildContext context, SignInModel signInModel,
            ValidationModel validationModel, _) {
          return CupertinoPageScaffold(
            key: _key,
            child: _buildView(context, signInModel, validationModel),
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
                width: ScreenHelper.orientation == Orientation.portrait
                    ? ScreenHelper.screenHeight / 2
                    : ScreenHelper.screenWidth / 2,
                child: const Image(image: AssetImage(AppImages.logoImage))),
            Expanded(
              child: signInModel.viewState == ViewState.Busy
                  ? AppProgressIndicator()
                  : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoTextField(
                    obscureText: false,
                    onChanged: (value){},
                  ),
                  CupertinoButton(
                    child:Text(
                    '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signIn))}'),
                    onPressed: () async {
                      Navigator.of(context)
                          .pushReplacementNamed(mainRoute);
                    },
                  ),
                  CustomFlatButton(
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
