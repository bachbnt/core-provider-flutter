import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:bach_flutter_app/viewModels/localeModel.dart';
import 'package:bach_flutter_app/viewModels/settingModel.dart';
import 'package:bach_flutter_app/viewModels/themeModel.dart';
import 'package:bach_flutter_app/views/baseView.dart';
import 'package:bach_flutter_app/widgets/appExpansion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<SettingModel>(
        model: SettingModel(),
        builder: (context, model, _) => _buildView(context, model),
      ),
    );
  }

  Widget _buildView(BuildContext context, SettingModel model) {
    ScreenUtil.init(context);
    ThemeModel themeModel = Provider.of<ThemeModel>(context);
    LocaleModel localeModel = Provider.of<LocaleModel>(context);

    return ListView(
      children: <Widget>[
        SwitchListTile(
          title: Text('${ScreenUtil.t(I18nKey.darkMode)}'),
          value: themeModel.appTheme == AppTheme.Dark,
          onChanged: (bool value) {
            Provider.of<ThemeModel>(context, listen: false)
                .toggleTheme(value ? AppTheme.Dark : AppTheme.Light);
          },
        ),
        AppExpansion.builder(
          header: Text('${ScreenUtil.t(I18nKey.language)}'),
          itemCount: supportedLocales.length,
          itemBuilder: (int index) {
            return RadioListTile<AppLocale>(
              title: Text('${ScreenUtil.t(model.languages[index])}'),
              value: appLocales[index],
              groupValue: localeModel.appLocale,
              onChanged: (AppLocale value) {
                Provider.of<LocaleModel>(context, listen: false)
                    .toggleLocale(value);
              },
            );
          },
        ),
      ],
    );
  }
}
