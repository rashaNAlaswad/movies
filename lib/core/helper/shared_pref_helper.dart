import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static SecureStorageHelper? _instance;

  factory SecureStorageHelper() {
    return _instance ??= SecureStorageHelper._();
  }

  SecureStorageHelper._();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  Future<void> setSecuredString(String key, String value) async {
    debugPrint('SecureStorageHelper: Setting secured string for key: $key');
    await _secureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage for the given [key].
  Future<String?> getSecuredString(String key) async {
    debugPrint('SecureStorageHelper: Getting secured string for key: $key');
    return await _secureStorage.read(key: key);
  }

  Future<void> setSecuredBool(String key, bool value) async {
    debugPrint('SecureStorageHelper: Setting secured bool for key: $key');
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<bool?> getSecuredBool(String key) async {
    debugPrint('SecureStorageHelper: Getting secured bool for key: $key');
    return await _secureStorage.read(key: key) == 'true';
  }

  /// Removes a value from secure storage with given [key].
  Future<void> removeSecuredData(String key) async {
    debugPrint('SecureStorageHelper: Removing secured data for key: $key');
    await _secureStorage.delete(key: key);
  }

  /// Removes all keys and values from FlutterSecureStorage.
  Future<void> clearAllSecuredData() async {
    debugPrint('SecureStorageHelper: Clearing all secured data');
    await _secureStorage.deleteAll();
  }
}
