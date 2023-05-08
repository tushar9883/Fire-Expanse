import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();

  static Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await storage.readAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {}
    return map;
  }

  static Future<void> deleteAll() async {
    try {
      await storage.deleteAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      // _readAll();
    } catch (e) {}
  }

  static Future<String> readSecureData(String key, {String defaultValue = ""}) async {
    String value = defaultValue;
    try {
      value = (await storage.read(
            key: key,
            iOptions: _getIOSOptions(),
            aOptions: _getAndroidOptions(),
          )) ??
          defaultValue;
    } catch (e) {}
    return value;
  }

  static Future<void> deleteSecureData(String key) async {
    try {
      await storage.delete(
        key: key,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<void> writeSecureData(String key, String value) async {
    try {
      await storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {}
  }

  static IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      );

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
