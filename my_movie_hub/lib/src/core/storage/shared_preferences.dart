import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends LocalStorageService {
  SharedPreferencesService({required this.preferences});
  final SharedPreferences preferences;

  static const sessionIdKey = 'sessionIdKey';
  static const accountIdKey = 'accountIdKey';

  @override
  String? getSessionId() {
    return preferences.getString(sessionIdKey);
  }

  @override
  void setSessionId(String sessionId) {
    preferences.setString(sessionIdKey, sessionId);
  }

  @override
  void removeSessionId() {
    preferences.remove(sessionIdKey);
  }

  @override
  int? getAccountId() {
    return preferences.getInt(accountIdKey);
  }

  @override
  void setAccountId(int accountId) {
    preferences.setInt(accountIdKey, accountId);
  }

  @override
  void removeAccountId() {
    preferences.remove(accountIdKey);
  }
}
