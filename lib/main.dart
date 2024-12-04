import 'package:flutter_common/services/local_storage/secure_storage/secure_storage_helper.dart';
import 'package:flutter_common/services/local_storage/secure_storage/secure_storage_helper_impl.dart';
import 'package:flutter_common/utils/common_utils.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> initial() async {
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelperImpl());

  getIt.registerLazySingleton<CommonUtils>(() => CommonUtils());
}
