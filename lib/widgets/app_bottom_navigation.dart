import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:bach_flutter_app/view_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({Key key, @required this.callback})
      : super(key: key);

  final MainViewChildCallback callback;

  @override
  _AppBottomNavigationState createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(mainViewIcons[0]),
            title: Text(toBeginningOfSentenceCase(
                AppLocalizations.of(context).translate(mainViewTitles[0])))),
        BottomNavigationBarItem(
            icon: Icon(mainViewIcons[1]),
            title: Text(toBeginningOfSentenceCase(
                AppLocalizations.of(context).translate(mainViewTitles[1])))),
        BottomNavigationBarItem(
            icon: Icon(mainViewIcons[2]),
            title: Text(toBeginningOfSentenceCase(
                AppLocalizations.of(context).translate(mainViewTitles[2])))),
        BottomNavigationBarItem(
            icon: Icon(mainViewIcons[3]),
            title: Text(toBeginningOfSentenceCase(
                AppLocalizations.of(context).translate(mainViewTitles[3])))),
        BottomNavigationBarItem(
            icon: Icon(mainViewIcons[4]),
            title: Text(toBeginningOfSentenceCase(
                AppLocalizations.of(context).translate(mainViewTitles[4])))),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          switch (index) {
            case 0:
              widget.callback(MainViewChild.MainView1);
              break;
            case 1:
              widget.callback(MainViewChild.MainView2);
              break;
            case 2:
              widget.callback(MainViewChild.MainView3);
              break;
            case 3:
              widget.callback(MainViewChild.MainView4);
              break;
            case 4:
              widget.callback(MainViewChild.MainView5);
              break;
            default:
              widget.callback(MainViewChild.MainView1);
          }
        });
      },
    );
  }
}
