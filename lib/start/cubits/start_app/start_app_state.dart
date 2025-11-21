import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_app_state.freezed.dart';

@freezed
abstract class StartAppState with _$StartAppState {
  const factory StartAppState({
    @Default(null) bool? isLoged,
    @Default(false) bool isObscureTextPassLogin,
    @Default(false) bool isObscureTextPassRegister,
    @Default(false) bool isObscureTextRepeatPassRegister,
  }) = _StartAppState;
}
