//import 'package:devblock_flutter_app/app_localizations.dart';
//import 'package:devblock_flutter_app/app_router.dart';
//import 'package:devblock_flutter_app/view_models/locale_model.dart';
//import 'package:devblock_flutter_app/view_models/notification_model.dart';
//import 'package:devblock_flutter_app/view_models/theme_model.dart';
//import 'package:devblock_flutter_app/views/base_view.dart';
//import 'package:devblock_flutter_app/widgets/custom_expansion.dart';
//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:provider/provider.dart';
//
//class SettingsView extends StatefulWidget {
//  var args;
//
//  SettingsView(this.args);
//
//  @override
//  _SettingsViewState createState() => _SettingsViewState();
//}
//
//class _SettingsViewState extends State<SettingsView> {
//  List<String> list = ['english', 'vietnamese'];
//  List<String> accList = [
//    "blocked users",
//    "change password",
//    "deactivate account"
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return BaseView<NotificationModel>(
//      model: NotificationModel(),
//      onModelReady: (model) async {},
//      builder: (context, model, _) => buildView(context, model),
//    );
//  }
//
//  Widget buildView(BuildContext context, NotificationModel model) {
//    return ListView(
//      children: [
//        SwitchListTile(
//          title: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('dark mode'))}'),
//          value:
//              Provider.of<ThemeModel>(context).currentTheme == ThemeData.dark()
//                  ? true
//                  : false,
//          onChanged: (value) {
//            Provider.of<ThemeModel>(context, listen: false)
//                .toggleTheme(value ? ThemeData.dark() : ThemeData.light());
//          },
//        ),
//        ExpansionList.builder(
//          header: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('language'))}'),
//          itemCount: LocaleModel.locales.length,
//          itemBuilder: (index) {
//            return RadioListTile(
//              title: Text(
//                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${list[index]}'))}'),
//              value: LocaleModel.locales[index],
//              groupValue: Provider.of<LocaleModel>(context).currentLocale,
//              onChanged: (value) {
//                Provider.of<LocaleModel>(context, listen: false)
//                    .toggleLocale(value);
//              },
//            );
//          },
//        ),
//        ExpansionList.builder(
//          header: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('notifications'))}'),
//          itemCount: NotificationModel.notifications.length,
//          itemBuilder: (index) {
//            return SwitchListTile(
//              title: Text(
//                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${NotificationModel.notifications[index].title}'))}'),
//              value: NotificationModel.notifications[index].value,
//              onChanged: (value) {
//                model.changeNotification(
//                    NotificationModel.notifications[index], value);
//              },
//            );
//          },
//        ),
//        ExpansionList.builder(
//          header: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('account'))}'),
//          itemCount: accList.length,
//          itemBuilder: (index) {
//            return ListTile(
//              title: Text(
//                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${accList[index]}'))}'),
//              onTap: () => Navigator.of(context).pushNamed(webRoute),
//            );
//          },
//        ),
//        ListTile(
//          title: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('privacy policy'))}'),
//          onTap: () => Navigator.of(context).pushNamed(webRoute),
//        ),
//        ListTile(
//          title: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('terms and conditions'))}'),
//          onTap: () => Navigator.of(context).pushNamed(webRoute),
//        ),
//        ListTile(
//          title: Text(
//              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('log out'))}'),
//          onTap: () => Navigator.of(context).pushReplacementNamed(loginRoute),
//        ),
//      ],
//    );
//  }
//}
