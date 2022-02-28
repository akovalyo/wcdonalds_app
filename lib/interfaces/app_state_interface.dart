abstract class AppStateInterface {
  bool get isInitialized;
  bool get isDarkTheme;
  String get platform;
  Uri? get destUri;

  void initializeApp();
  void changeTheme();
  void pushDestUri(Uri uri);
  Uri? popDestUri();
}
