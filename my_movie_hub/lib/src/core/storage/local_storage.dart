abstract class LocalStorageService {
  void setSessionId(String sessionId);
  String? getSessionId();
  void removeSessionId();
  void setAccountId(int accountId);
  int? getAccountId();
  void removeAccountId();
}
