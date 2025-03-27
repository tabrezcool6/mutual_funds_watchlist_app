import 'package:mutual_funds_watchlist/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mutual_funds_watchlist/core/common/services/connection_checker.dart';
import 'package:mutual_funds_watchlist/core/keys/app_keys.dart';
import 'package:mutual_funds_watchlist/features/auth/data/datasources/auth_supabase_data_source.dart';
import 'package:mutual_funds_watchlist/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_sign_in_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_session_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/auth_verify_otp_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/usecases/user_sign_out_usecase.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mutual_funds_watchlist/features/auth/presentation/bloc/otp_timer_cubit/otp_timer_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// initialize Service Locator globally
// This is the variable where we register all our dependicies to getIt
final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // initiailize Auth Dependencies
  _initAuth();

  // initializing the SUPABASE Database and also Server
  // to do so we require a "Project URL" and a "Anon Key" which is provided by the project created in the supabase
  final subapase = await Supabase.initialize(
    url: Keys.supabaseProjectUrl,
    anonKey: Keys.supabaseAnonKey,
  );

  /// creating singleton class of supabase, since we need only one instance overall the app
  serviceLocator.registerLazySingleton(() => subapase.client);

  /// initaializug local storage dependancy
  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  // serviceLocator.registerLazySingleton(() => Hive.box(name: 'watchlists'));

  // core cubits to check user session and otp timer
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerLazySingleton(() => OtpTimerCubit());

  // internet connection checker
  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImplementation(serviceLocator()),
  );
}

void _initAuth() {
  ///
  /// registering "AuthSupabaseDataSourceImplementation" Dependency
  serviceLocator
    ..registerFactory<AuthSupabaseDataSource>(
      () => AuthSupabaseDataSourceImplementation(serviceLocator()),
    )
    ///
    /// registering "AuthRepositoryImplementation" Dependency
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImplementation(serviceLocator(), serviceLocator()),
    )
    ///
    /// registering "AuthSignIn" UseCase Dependency
    ..registerFactory(() => AuthSignIn(serviceLocator()))
    ///
    /// registering "AuthVerifyOTP" UseCase Dependency
    ..registerFactory(() => AuthVerifyOtp(serviceLocator()))
    ///
    /// registering "AuthSession" UseCase Dependency
    ..registerFactory(() => AuthSession(serviceLocator()))
    ///
    /// registering "AuthSignOut" UseCase Dependency
    ..registerFactory(() => AuthSignOut(serviceLocator()))
    ///
    /// registering "AuthBloc" Dependency
    ..registerLazySingleton(
      () => AuthBloc(
        authSignIn: serviceLocator(),
        authVerifyOtp: serviceLocator(),
        authSignOut: serviceLocator(),
        authSession: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
