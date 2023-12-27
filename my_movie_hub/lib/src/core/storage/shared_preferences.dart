import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends LocalStorageService {
  SharedPreferencesService({required this.preferences});
  final SharedPreferences preferences;

  static const exampleDataKey = 'exampleDataKey';

  @override
  String? getExampleData() {
    return preferences.getString(exampleDataKey);
  }

  @override
  void setExampleData(String exampleData) {
    preferences.setString(exampleDataKey, exampleData);
  }

  @override
  void removeExampleData() {
    preferences.remove(exampleDataKey);
  }
}
