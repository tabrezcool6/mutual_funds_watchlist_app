part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


final class AuthSignInEvent extends AuthEvent {
  final String phone;

  AuthSignInEvent({required this.phone});
}

final class AuthVerifyOtpEvent extends AuthEvent {
  final String phone;
  final String otp;

  AuthVerifyOtpEvent({required this.phone, required this.otp});
}

final class AuthIsUserLoggedIn extends AuthEvent {}

final class AuthSignOutEvent extends AuthEvent {}
