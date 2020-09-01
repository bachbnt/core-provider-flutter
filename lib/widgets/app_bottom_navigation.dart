import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:bach_flutter_app/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBottomNavigation extends StatefulWidget {
  final MainViewChildCallback callback;

  const AppBottomNavigation({Key key, this.callback}) : super(key: key);

  @override
  _AppBottomNavigationState createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;

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
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(_icons[0]),
            title: Text(toBeginningOfSentenceCase(_titles[0]))),
        BottomNavigationBarItem(
            icon: Icon(_icons[1]),
            title: Text(toBeginningOfSentenceCase(_titles[1]))),
        BottomNavigationBarItem(
            icon: Icon(_icons[2]),
            title: Text(toBeginningOfSentenceCase(_titles[2]))),
        BottomNavigationBarItem(
            icon: Icon(_icons[3]),
            title: Text(toBeginningOfSentenceCase(_titles[3]))),
        BottomNavigationBarItem(
            icon: Icon(_icons[4]),
            title: Text(toBeginningOfSentenceCase(_titles[4]))),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
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
