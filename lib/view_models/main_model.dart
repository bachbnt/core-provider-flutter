import 'package:bach_flutter_app/models/user.dart';
import 'package:bach_flutter_app/services/repository.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

enum MainViewChild { MainView1, MainView2, MainView3, MainView4, MainView5 }

const List<String> mainViewTitles = <String>[
  'title1',
  'title2',
  'title3',
  'title3',
  'title5'
];

const List<IconData> mainViewIcons = <IconData>[
  FontAwesome.google,
  FontAwesome.google,
  FontAwesome.google,
  FontAwesome.google,
  FontAwesome.google,
  Icons.settings,
  Icons.exit_to_app
];

class MainModel extends BaseModel {
  MainViewChild currentView = MainViewChild.MainView1;
  String currentTitle = mainViewTitles[0];
  final Repository _repository = Repository.instance;
  User currentUser;

  void initCurrentUser() => currentUser = _repository.currentUser;

  void navigateView(MainViewChild newView) {
    if (newView == currentView) return;
    currentView = newView;
    _changeAppBarTitle();
    notifyListeners();
  }

  void _changeAppBarTitle() {
    switch (currentView) {
      case MainViewChild.MainView1:
        currentTitle = mainViewTitles[0];
        break;
      case MainViewChild.MainView2:
        currentTitle = mainViewTitles[1];
        break;
      case MainViewChild.MainView3:
        currentTitle = mainViewTitles[2];
        break;
      case MainViewChild.MainView4:
        currentTitle = mainViewTitles[3];
        break;
      case MainViewChild.MainView5:
        currentTitle = mainViewTitles[4];
        break;
      default:
        currentTitle = mainViewTitles[0];
        break;
    }
  }
}
