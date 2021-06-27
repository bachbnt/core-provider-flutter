import 'package:bach_flutter_app/core/i18n/i18nKey.dart';
import 'package:bach_flutter_app/viewModels/baseModel.dart';

class SettingModel extends BaseModel {
  List<String> languages = <String>[I18nKey.english, I18nKey.vietnamese];
}
