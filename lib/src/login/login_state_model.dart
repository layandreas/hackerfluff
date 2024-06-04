import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state_model.g.dart';
part 'login_state_model.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String? user,
    required String? authCookieRequestHeader,
    required bool isLoading,
    required bool error,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, Object?> json) =>
      _$LoginStateFromJson(json);
}
