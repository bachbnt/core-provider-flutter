import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:bach_flutter_app/constants/enums.dart';
import 'package:bach_flutter_app/models/user.dart';
import 'package:bach_flutter_app/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDrawer extends StatefulWidget {
  final MainViewChildCallback callback;

  const AppDrawer({Key key, this.callback}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final Repository _repository = Repository.instance;
  User _user;

  final List<IconData> _icons = [
    Icons.title,
    Icons.title,
    Icons.title,
    Icons.title,
    Icons.title
  ];

  final List<String> _titles = [
    'title1',
    'title2',
    'title3',
    'title4',
    'title5'
  ];

  @override
  void initState() {
    _repository.initUser(User(firstName: 'bach',lastName: 'bui',email: 'bachbnt@devblock.net'));
    _user = _repository.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(),
          accountName: Text('${_user.firstName} ${_user.lastName}'),
          accountEmail: Text('${_user.email}'),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${_titles[0]}'))}'),
          leading: Icon(_icons[0]),
          onTap: () => widget.callback(MainViewChild.MainView1),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${_titles[1]}'))}'),
          leading: Icon(_icons[1]),
          onTap: () => widget.callback(MainViewChild.MainView2),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${_titles[2]}'))}'),
          leading: Icon(_icons[2]),
          onTap: () => widget.callback(MainViewChild.MainView3),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${_titles[3]}'))}'),
          leading: Icon(_icons[3]),
          onTap: () => widget.callback(MainViewChild.MainView4),
        ),
        ListTile(
          title: Text(
              '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate('${_titles[4]}'))}'),
          leading: Icon(_icons[4]),
          onTap: () => widget.callback(MainViewChild.MainView5),
        ),
      ]),
    );
  }
}
