import 'package:bach_flutter_app/constants/appImage.dart';
import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class AppBotNav extends StatefulWidget {
  AppBotNav({@required this.callback});

  final Function(String) callback;

  @override
  _AppBotNavState createState() => _AppBotNavState();
}

class _AppBotNavState extends State<AppBotNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            AppImage.main1Icon,
            color: Colors.black,
          ),
          label: '${ScreenUtil.t(I18nKey.main1Title)}',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppImage.main2Icon,
            color: Colors.black,
          ),
          label: '${ScreenUtil.t(I18nKey.main2Title)}',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppImage.main3Icon,
            color: Colors.black,
          ),
          label: '${ScreenUtil.t(I18nKey.main3Title)}',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppImage.main4Icon,
            color: Colors.black,
          ),
          label: '${ScreenUtil.t(I18nKey.main4Title)}',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            AppImage.main5Icon,
            color: Colors.black,
          ),
          label: '${ScreenUtil.t(I18nKey.main5Title)}',
        )
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          switch (index) {
            case 0:
              widget.callback(RouteName.view1);
              break;
            case 1:
              widget.callback(RouteName.view2);
              break;
            case 2:
              widget.callback(RouteName.view3);
              break;
            case 3:
              widget.callback(RouteName.view4);
              break;
            case 4:
              widget.callback(RouteName.setting);
              break;
          }
        });
      },
    );
  }
}
