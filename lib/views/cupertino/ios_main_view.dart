import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/constants/app_images.dart';
import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/view_models/main_model.dart';
import 'package:bach_flutter_app/views/base_view.dart';
import 'package:bach_flutter_app/views/cupertino/ios_setting_view.dart';
import 'package:bach_flutter_app/views/fifth_view.dart';
import 'package:bach_flutter_app/views/first_view.dart';
import 'package:bach_flutter_app/views/fourth_view.dart';
import 'package:bach_flutter_app/views/second_view.dart';
import 'package:bach_flutter_app/views/material/android_setting_view.dart';
import 'package:bach_flutter_app/views/third_view.dart';
import 'package:bach_flutter_app/widgets/cupertino/ios_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IOSMainView extends StatefulWidget {
  @override
  _IOSMainViewState createState() => _IOSMainViewState();
}

class _IOSMainViewState extends State<IOSMainView> {
  final GlobalKey _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<MainModel>(
        model: MainModel(),
        onModelReady: (MainModel model) {
          model.initCurrentUser();
        },
        builder: (BuildContext context, MainModel model, _) {
          return CupertinoTabScaffold(
            key: _globalKey,
            tabBar: CupertinoTabBar(
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
              currentIndex: model.currentIndex,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    model.navigateView(MainViewChild.MainView1);
                    break;
                  case 1:
                    model.navigateView(MainViewChild.MainView2);
                    break;
                  case 2:
                    model.navigateView(MainViewChild.MainView3);
                    break;
                  case 3:
                    model.navigateView(MainViewChild.MainView4);
                    break;
                  case 4:
                    model.navigateView(MainViewChild.MainView5);
                    break;
                }
                model.updateIndex(index);
              },
            ),
            tabBuilder: (context, index){
              return CupertinoTabView(
                builder: (context){
                  return CupertinoPageScaffold(
                    navigationBar: IOSNavigationBar(
                        text:
                        '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.currentTitle))}'),
                    child: _buildView(model.currentView, null),
                  );
                },
              );
            },
          );
        });
  }

  Widget _buildView(MainViewChild view, dynamic arguments) {
    switch (view) {
      case MainViewChild.MainView1:
        return FirstView(arguments);
      case MainViewChild.MainView2:
        return SecondView(arguments);
      case MainViewChild.MainView3:
        return ThirdView(arguments);
      case MainViewChild.MainView4:
        return FourthView(arguments);
      case MainViewChild.MainView5:
        return IOSSettingView();
      default:
        return FirstView(arguments);
    }
  }
}
