import 'package:bach_flutter_app/constants/appImage.dart';
import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({@required this.callback});

  final Function(String) callback;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.main1Title)}'),
          leading: const Icon(AppImage.main1Icon),
          onTap: () => widget.callback(RouteName.view1),
        ),
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.main2Title)}'),
          leading: const Icon(AppImage.main2Icon),
          onTap: () => widget.callback(RouteName.view2),
        ),
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.main3Title)}'),
          leading: const Icon(AppImage.main3Icon),
          onTap: () => widget.callback(RouteName.view3),
        ),
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.main4Title)}'),
          leading: const Icon(AppImage.main4Icon),
          onTap: () => widget.callback(RouteName.view4),
        ),
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.setting)}'),
          leading: const Icon(AppImage.settingIcon),
          onTap: () => widget.callback(RouteName.setting),
        ),
        ListTile(
          title: Text('${ScreenUtil.t(I18nKey.signOut)}'),
          leading: const Icon(AppImage.signOutIcon),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(RouteName.signIn),
        ),
      ]),
    );
  }
}
