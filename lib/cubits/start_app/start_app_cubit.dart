import 'package:firebase_flutter_cifo/cubits/start_app/start_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit() : super(StartAppState());

  Future<void> init() async {
    emit(state.copyWith(isLoged: false));
  }

  Future<void> loginSesion() async {
    emit(state.copyWith(isLoged: true));
  }

  Future<void> logOutSesion() async {
    emit(state.copyWith(isLoged: false));
  }
}
