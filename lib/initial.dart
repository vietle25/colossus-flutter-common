import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'services/firebase/database/firebase_database_helper.dart';
import 'services/firebase/database/firebase_database_helper_impl.dart';
import 'services/local_storage/secure_storage/secure_storage_helper.dart';
import 'services/local_storage/secure_storage/secure_storage_helper_impl.dart';
import 'utils/common_utils.dart';

GetIt getIt = GetIt.instance;

class BootFlutterCommon {
  static Future<void> initialCommonPackages() async {
    await Firebase.initializeApp();

    getIt.registerLazySingleton<SecureStorageHelper>(
        () => SecureStorageHelperImpl());

    getIt.registerLazySingleton<CommonUtils>(() => CommonUtils());

    getIt.registerLazySingleton<FirebaseDatabaseHelper>(
        () => FirebaseDatabaseHelperImpl());
  }
}
