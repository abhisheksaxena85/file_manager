import 'package:filemanager/data/local_data_storage/shared_preference/preference.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  /// Shared - Preference
  getIt.registerLazySingleton<Preference>(() => Preference());
}
