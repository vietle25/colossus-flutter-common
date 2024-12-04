library boot_flutter_common;

import 'package:boot_flutter_common/services/local_storage/secure_storage/secure_storage_helper.dart';
import 'package:boot_flutter_common/services/local_storage/secure_storage/secure_storage_helper_impl.dart';
import 'package:boot_flutter_common/utils/common_utils.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> initial() async {
  getIt.registerLazySingleton<SecureStorageHelper>(
      () => SecureStorageHelperImpl());

  getIt.registerLazySingleton<CommonUtils>(() => CommonUtils());
}
