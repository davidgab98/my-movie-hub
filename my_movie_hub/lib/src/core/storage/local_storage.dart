abstract class LocalStorageService {
  void setSessionId(String sessionId);
  String? getSessionId();
  void removeSessionId();
  void setAccountId(int accountId);
  int? getAccountId();
  void removeAccountId();
  void setLanguage(String language);
  String? getLanguage();
  void removeLanguage();
  void setIsDarkTheme({required bool isDark});
  bool? getIsDarkTheme();
  void removeIsDarkTheme();
}
