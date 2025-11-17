//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:firebase_flutter_cifo/auth/data/models/auth_dto.dart';
import 'package:firebase_flutter_cifo/auth/data/repository/auth_firebase_repository.dart';
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

  Future<void> signInAnonymously() async {
    AuthDto? myUserCredential =
        await AuthFirebaseRepository.signInAnonymously();

    if (myUserCredential?.isAnonymous == true) {
      emit(state.copyWith(isLoged: true));
    }
  }
}
