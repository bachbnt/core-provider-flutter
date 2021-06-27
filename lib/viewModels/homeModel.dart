import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/viewModels/baseModel.dart';

class HomeModel extends BaseModel {
  String currentRoute = RouteName.view1;

  void navigate(String value) {
    if (value == currentRoute) return;
    currentRoute = value;
    notifyListeners();
  }
}
