import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:bach_flutter_app/view_models/base_model.dart';

class SettingModel extends BaseModel {
  List<String> languages = <String>[
    AppStrings.english,
    AppStrings.chinese,
    AppStrings.vietnamese
  ];
  List<String> options = <String>[
    AppStrings.setting1Option,
    AppStrings.setting2Option,
    AppStrings.setting3Option
  ];
}
