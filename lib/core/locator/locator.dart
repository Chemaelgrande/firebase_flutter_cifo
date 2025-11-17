import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  await registerCubits();
}

registerCubits() async {
  if (!locator.isRegistered<StartAppCubit>()) {
    locator.registerLazySingleton(() => StartAppCubit());
  }
}
