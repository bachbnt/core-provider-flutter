import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:bach_flutter_app/view_models/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class IOSTabBar extends StatefulWidget {
  const IOSTabBar({Key key, @required this.callback})
      : super(key: key);

  final MainViewChildCallback callback;

  @override
  _IOSTabBarState createState() =>
      _IOSTabBarState();
}

class _IOSTabBarState extends State<IOSTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(AppImages.main1Icon),
            title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context)
                .translate(AppStrings.main1Title)))),
        BottomNavigationBarItem(
            icon: const Icon(AppImages.main2Icon),
            title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context)
                .translate(AppStrings.main2Title)))),
        BottomNavigationBarItem(
            icon: const Icon(AppImages.main3Icon),
            title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context)
                .translate(AppStrings.main3Title)))),
        BottomNavigationBarItem(
            icon: const Icon(AppImages.main4Icon),
            title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context)
                .translate(AppStrings.main4Title)))),
        BottomNavigationBarItem(
            icon: const Icon(AppImages.main5Icon),
            title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context)
                .translate(AppStrings.main5Title)))),
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
          }
        });
      },
    );
  }
}
