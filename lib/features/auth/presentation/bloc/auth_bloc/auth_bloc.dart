import 'package:mutual_funds_watchlist/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mutual_funds_watchlist/core/usecase/usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_sign_in_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_session_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/user_sign_out_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_verify_otp_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// STEP 10 - Create Auth Bloc for the feature
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignIn _authSignIn;
  final AuthVerifyOtp _authVerifyOtp;
  final AuthSignOut _authSignOut;
  final AuthSession _authSession;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required AuthSignIn authSignIn,
    required AuthVerifyOtp authVerifyOtp,
    required AuthSignOut authSignOut,
    required AuthSession authSession,
    required AppUserCubit appUserCubit,
  }) : _authSignIn = authSignIn,
       _authVerifyOtp = authVerifyOtp,
       _authSignOut = authSignOut,
       _authSession = authSession,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {
    // Default Loader State for all events
    on<AuthEvent>((_, emit) => emit(AuthLoading()));

    // Sign In Bloc Implementation
    on<AuthSignInEvent>(_onAuthSignIn);

    // Verify Otp Bloc Implementation
    on<AuthVerifyOtpEvent>(_onAuthVerifyOtp);

    // Sign Out Bloc Implementation
    on<AuthSignOutEvent>(_onAuthSignOut);

    // Current User Bloc Implementation
    on<AuthIsUserLoggedIn>(_onAuthIsUserLoggedIn);
  }

  ///
  /// Auth SignIn Event Method
  void _onAuthSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    final response = await _authSignIn(AuthSignInParams(phone: event.phone));

    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (res) => emit(AuthSuccess()),
    );
  }

  ///
  /// Auth Verify Otp Event Method
  void _onAuthVerifyOtp(
    AuthVerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authVerifyOtp(
      AuthVerifyOtpParams(phone: event.phone, otp: event.otp),
    );

    response.fold(
      (failure) => emit(AuthOtpFailure(failure.message)),
      // (res) => emit(AuthSuccess()),
      (res) => emit(AuthOtpSuccess()),
    );
  }

  ///
  /// Auth SignOut Event Method
  void _onAuthSignOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    final response = await _authSignOut(NoParams());

    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      // (r) => emit(AuthSuccess()),
      (r) => emit(AuthSignOutSuccess()),
    );
  }

  ///
  /// Auth AuthUserSession Event Method
  void _onAuthIsUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _authSession(NoParams());

    result.fold((failure) => emit(AuthFailure(failure.message)), (session) {
      _appUserCubit.checkSession(session);
      emit(AuthSessionSuccess());
    });
  }
}
