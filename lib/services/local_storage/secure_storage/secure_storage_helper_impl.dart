import 'package:colossus_flutter_common/services/local_storage/secure_storage/secure_storage_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelperImpl implements SecureStorageHelper {
  late FlutterSecureStorage secureStorage;

  SecureStorageHelperImpl() : super() {
    secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<void> write({required String key, required String? value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<bool> delete({required String key}) async {
    await secureStorage.delete(key: key);
    return true;
  }

  @override
  Future<void> deleteAllData() async {
    await secureStorage.deleteAll();
  }

  @override
  Future<Map<String, String?>> readAll() async {
    return await secureStorage.readAll();
  }
}
