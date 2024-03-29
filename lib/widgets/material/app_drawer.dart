import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:bach_flutter_app/models/user.dart';
import 'package:bach_flutter_app/view_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer(
      {Key key, @required this.callback, @required this.currentUser})
      : super(key: key);

  final MainViewChildCallback callback;
  final User currentUser;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(),
          accountName: Text(
              '${widget.currentUser.firstName} ${widget.currentUser.lastName}'),
          accountEmail: Text('${widget.currentUser.email}'),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.main1Title))}'),
          leading: const Icon(AppImages.main1Icon),
          onTap: () => widget.callback(MainViewChild.MainView1),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.main2Title))}'),
          leading: const Icon(AppImages.main1Icon),
          onTap: () => widget.callback(MainViewChild.MainView2),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.main3Title))}'),
          leading: const Icon(AppImages.main1Icon),
          onTap: () => widget.callback(MainViewChild.MainView3),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.main4Title))}'),
          leading: const Icon(AppImages.main1Icon),
          onTap: () => widget.callback(MainViewChild.MainView4),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.main5Title))}'),
          leading: const Icon(AppImages.main1Icon),
          onTap: () => widget.callback(MainViewChild.MainView5),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.setting))}'),
          leading: const Icon(AppImages.settingIcon),
          onTap: () => Navigator.of(context).pushNamed(settingRoute),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(AppStrings.signOut))}'),
          leading: const Icon(AppImages.signOutIcon),
          onTap: () => Navigator.of(context).pushReplacementNamed(signInRoute),
        ),
      ]),
    );
  }
}
