import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) showNewPassword,
    @Default(false) showConfirmPassword,
    @Default(false) errNewPassword,
    @Default(false) errConfirmPassword,
    @Default(false) wait,
}) = _ResetPasswordState;
}
