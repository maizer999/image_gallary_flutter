import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../main.dart';

class SecureStorageConstants {
  static const String userName = 'userName';
  static const String password = 'password';
  static const String token = 'token';
  static const String uuid = 'uuid';
  static const String refreshToken = 'refreshToken';
  static const String tokenPcs = 'token_pcs';
  static const String refreshTokenPcs = 'refreshToken_pcs';


}

class SecureStorageHelper {
  static Future<String?> getRefreshToken() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final value = secureStorage.get(key: SecureStorageConstants.refreshToken);
    return value;
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.save(
        key: SecureStorageConstants.refreshToken, value: refreshToken);
  }

  static Future<void> setAccessToken(String token) async {
    await setTempAccessToken(token);
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.save(key: SecureStorageConstants.token, value: token);
  }

  static Future<String?> getAccessToken() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final tempToken = secureStorage.getTemp(key: SecureStorageConstants.token);
    if (tempToken != null) {
      return tempToken;
    }
    final value = secureStorage.get(key: SecureStorageConstants.token);
    return value;
  }


  static Future<String?> getPCSRefreshToken() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final value = secureStorage.get(key: SecureStorageConstants.refreshTokenPcs);
    return value;
  }

  static Future<void> setPCSRefreshToken(String refreshToken) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.save(
        key: SecureStorageConstants.refreshTokenPcs, value: refreshToken);
  }

  static Future<void> setPCSAccessToken(String token) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.save(key: SecureStorageConstants.tokenPcs, value: token);
  }

  static Future<String?> getPCSAccessToken() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final value = secureStorage.get(key: SecureStorageConstants.tokenPcs);
    return value;
  }

  static Future<void> setUUID(String token) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.save(key: SecureStorageConstants.uuid, value: token);
  }

  static Future<String?> getUUID() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final value = secureStorage.get(key: SecureStorageConstants.uuid);
    return value;
  }

  static Future<void> setTempAccessToken(String token) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    secureStorage.saveTemp(key: SecureStorageConstants.token, value: token);
  }

  static Future<void> setCredentials(String username, String password) async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    await secureStorage.save(key: SecureStorageConstants.userName, value: username);
    await secureStorage.save(key: SecureStorageConstants.password, value: password);
  }

  /// Retrieves the stored username and password
  static Future<Map<String, String?>> getCredentials() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final user = await secureStorage.get(key: SecureStorageConstants.userName);
    final pass = await secureStorage.get(key: SecureStorageConstants.password);
    return {
      SecureStorageConstants.userName: user,
      SecureStorageConstants.password: pass,
    };
  }


  static Future<String?> getTempAccessToken() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    final value = secureStorage.getTemp(key: SecureStorageConstants.token);
    return value;
  }

  static Future<void> logout() async {
    final secureStorage = providerContainer.read(secureStorageProvider);
    await secureStorage.delete(key: SecureStorageConstants.token);
    await secureStorage.delete(key: SecureStorageConstants.refreshToken);
    await secureStorage.delete(key: SecureStorageConstants.uuid);
    secureStorage.clearTemp();
  }
}

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Map<String, String?> _tempStorage = {};

  Future<String?> get({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> save({required String key, String? value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  String? getTemp({required String key}) {
    return _tempStorage[key];
  }

  void saveTemp({required String key, String? value}) {
    _tempStorage[key] = value;
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  void clearTemp() async {
    _tempStorage = {};
  }
}

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
