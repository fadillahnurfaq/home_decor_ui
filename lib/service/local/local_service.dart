import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalService {
  static const _storage = FlutterSecureStorage();
  static const _keySkipOnBoarding = 'skip_on_boarding';

  static IOSOptions _getIOSOptions() => IOSOptions();

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  static Future setSkipIntroduction() async {
    await _storage.write(
      key: _keySkipOnBoarding,
      value: "true",
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  static Future<bool> getSkipIntroduction() async {
    try {
      final value = await _storage.read(
        key: _keySkipOnBoarding,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      return value == "true";
    } catch (e) {
      return false;
    }
  }
}
