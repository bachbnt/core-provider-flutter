import 'package:bach_flutter_app/constants/enums.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

class MainModel extends BaseModel {
  static List<String> _titles = [
    'title1',
    'title2',
    'title3',
    'title3',
    'title5'
  ];

  MainViewChild _currentView = MainViewChild.MainView1;
  String _currentTitle = _titles[0];

  MainViewChild get currentView => _currentView;

  String get currentTitle => _currentTitle;

  void navigateView(MainViewChild view) {
    if (view == _currentView) return;
    _currentView = view;
    _changeAppBarTitle();
    notifyListeners();
  }

  void _changeAppBarTitle() {
    switch (_currentView) {
      case MainViewChild.MainView1:
        _currentTitle = _titles[0];
        break;
      case MainViewChild.MainView2:
        _currentTitle = _titles[1];
        break;
      case MainViewChild.MainView3:
        _currentTitle = _titles[2];
        break;
      case MainViewChild.MainView4:
        _currentTitle = _titles[3];
        break;
      case MainViewChild.MainView5:
        _currentTitle = _titles[4];
        break;
      default:
        _currentTitle = _titles[0];
        break;
    }
  }
}
