import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/setting_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/base_view.dart';
import 'package:bach_flutter_app/widgets/material/custom_expansion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AndroidSettingView extends StatefulWidget {
  @override
  _AndroidSettingViewState createState() => _AndroidSettingViewState();
}

class _AndroidSettingViewState extends State<AndroidSettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<SettingModel>(
        model: SettingModel(),
        builder: (BuildContext context, SettingModel model, _) =>
            _buildView(context, model),
      ),
    );
  }

  Widget _buildView(BuildContext context, SettingModel model) {
    return ListView(
      children: <Widget>[
        SwitchListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.darkMode))}'),
          value: Provider.of<ThemeModel>(context).appTheme == AppTheme.Dark,
          onChanged: (bool value) {
            Provider.of<ThemeModel>(context, listen: false)
                .toggleTheme(value ? AppTheme.Dark : AppTheme.Light);
          },
        ),
        CustomExpansion.builder(
          header: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.language))}'),
          itemCount: supportedLocales.length,
          itemBuilder: (int index) {
            return RadioListTile<AppLocale>(
              title: Text(
                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.languages[index]))}'),
              value: appLocales[index],
              groupValue: Provider.of<LocaleModel>(context).appLocale,
              onChanged: (AppLocale value) {
                Provider.of<LocaleModel>(context, listen: false)
                    .toggleLocale(value);
              },
            );
          },
        ),
        CustomExpansion.builder(
          header: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.option))}'),
          itemCount: model.options.length,
          itemBuilder: (int index) {
            return ListTile(
              title: Text(
                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.options[index]))}'),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
