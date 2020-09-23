import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/models/user.dart';
import 'package:bach_flutter_app/services/repository.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

enum MainViewChild { MainView1, MainView2, MainView3, MainView4, MainView5 }

class MainModel extends BaseModel {
  MainViewChild currentView = MainViewChild.MainView1;
  String currentTitle = AppStrings.main1Title;
  int currentIndex = 0;
  final Repository _repository = Repository.instance;
  User currentUser;

  void initCurrentUser() => currentUser = _repository.currentUser;

  void navigateView(MainViewChild newView) {
    if (newView == currentView) return;
    currentView = newView;
    _changeAppBarTitle();
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  void _changeAppBarTitle() {
    switch (currentView) {
      case MainViewChild.MainView1:
        currentTitle = AppStrings.main1Title;
        break;
      case MainViewChild.MainView2:
        currentTitle = AppStrings.main2Title;
        break;
      case MainViewChild.MainView3:
        currentTitle = AppStrings.main3Title;
        break;
      case MainViewChild.MainView4:
        currentTitle = AppStrings.main4Title;
        break;
      case MainViewChild.MainView5:
        currentTitle = AppStrings.main5Title;
        break;
      default:
        currentTitle = AppStrings.main1Title;
        break;
    }
  }
}
