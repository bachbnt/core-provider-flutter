import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/setting_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/base_view.dart';
import 'package:bach_flutter_app/widgets/custom_expansion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List<String> accList = [
    "blocked users",
    "change password",
    "deactivate account"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<SettingModel>(
        model: SettingModel(),
        builder: (BuildContext context,SettingModel model, _) => _buildView(context, model),
      ),
    );
  }

  Widget _buildView(BuildContext context, SettingModel model) {
    return ListView(
      children: <Widget>[
        SwitchListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.darkMode))}'),
          value:
              Provider.of<ThemeModel>(context).appTheme == AppTheme.Dark,
          onChanged: (bool value) {
            Provider.of<ThemeModel>(context, listen: false)
                .toggleTheme(value ? AppTheme.Dark : AppTheme.Light);
          },
        ),
        CustomExpansion.builder(
          header: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('language'))}'),
          itemCount: supportedLocales.length,
          itemBuilder: (index) {
            return RadioListTile<dynamic>(
              title: Text(
                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${model.list[index]}'))}'),
              value: appLocales[index],
              groupValue: Provider.of<LocaleModel>(context).appLocale,
              onChanged: (dynamic value) {
                Provider.of<LocaleModel>(context, listen: false)
                    .toggleLocale(value);
              },
            );
          },
        ),
        CustomExpansion.builder(
          header: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('account'))}'),
          itemCount: accList.length,
          itemBuilder: (int index) {
            return ListTile(
              title: Text(
                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${accList[index]}'))}'),
              onTap: () => Navigator.of(context).pushNamed(mainRoute),
            );
          },
        ),
      ],
    );
  }
}
