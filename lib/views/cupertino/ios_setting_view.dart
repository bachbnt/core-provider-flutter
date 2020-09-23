import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/setting_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/base_view.dart';
import 'package:bach_flutter_app/widgets/material/custom_expansion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IOSSettingView extends StatefulWidget {
  @override
  _IOSSettingViewState createState() => _IOSSettingViewState();
}

class _IOSSettingViewState extends State<IOSSettingView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BaseView<SettingModel>(
        model: SettingModel(),
        builder: (BuildContext context, SettingModel model, _) =>
            _buildView(context, model),
      ),
    );
  }

  Widget _buildView(BuildContext context, SettingModel model) {
    return ListView(
      children: <Widget>[
        CupertinoSwitch(
          value: Provider.of<ThemeModel>(context).appTheme == AppTheme.Dark,
          onChanged: (bool value) {
            Provider.of<ThemeModel>(context, listen: false)
                .toggleTheme(value ? AppTheme.Dark : AppTheme.Light);
          },
        ),
        CupertinoSlidingSegmentedControl(
          children: {
            appLocales[0]: Text(
                '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.languages[0]))}'),
            appLocales[1]: Text(
                '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.languages[1]))}'),
            appLocales[2]: Text(
                '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.languages[2]))}')
          },
          onValueChanged: (AppLocale value) {
            Provider.of<LocaleModel>(context, listen: false)
                .toggleLocale(value);
          },
          groupValue: Provider.of<LocaleModel>(context).appLocale,
        ),
      ],
    );
  }
}
