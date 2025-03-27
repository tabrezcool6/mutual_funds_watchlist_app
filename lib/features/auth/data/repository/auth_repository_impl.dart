import 'package:mutual_funds_watchlist/core/constants.dart';
import 'package:mutual_funds_watchlist/core/error/exceptions.dart';
import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:mutual_funds_watchlist/features/auth/data/datasources/auth_supabase_data_source.dart';
import 'package:mutual_funds_watchlist/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

//
// STEP 6 - Implementation of Auth Repository of Domain Layer in Data Layer
class AuthRepositoryImplementation implements AuthRepository {
  // asking "AuthSupabaseDataSource" from a constructor
  // We are not initializing "AuthSupabaseDataSource" here beacause by doing so, it creates a dependancy between impl class and "AuthSupabaseDataSource" which we don't want
  // so that if we change "AuthSupabaseDataSource" in future, we just get that "DataSource" from a cunstructor but not initializing the whole stuff again
  // This is here what called as "Depemdemcy Injection",
  final AuthSupabaseDataSource authSupabaseDataSource;
  final InternetConnection internetConnection;

  AuthRepositoryImplementation(
    this.authSupabaseDataSource,
    this.internetConnection,
  );

  // "AuthRepositoryImplementation" sign in class which is implemented from the "AuthRepository" class
  @override
  Future<Either<Failure, void>> signIn({required String phone}) async {
    try {
      if (!await (internetConnection.hasInternetAccess)) {
        return left(Failure(Constants.noInternetConnectionMessage));
      }

      ///
      final response = await authSupabaseDataSource.signInWithPhone(
        phone: phone,
      );
      return right(response);

      // Auth Expcetion error handling
    } on supabase.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerExceptions catch (e) {
      return left(Failure(e.toString()));
    }
  }

  /// "AuthRepositoryImplementation" verify OTP class which is implemented from the "AuthRepository" class
  @override
  Future<Either<Failure, void>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      if (!await (internetConnection.hasInternetAccess)) {
        return left(Failure(Constants.noInternetConnectionMessage));
      }

      ///
      final response = await authSupabaseDataSource.verifyOtp(
        phone: phone,
        otp: otp,
      );
      return right(response);

      // Auth Expcetion error handling
    } on supabase.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerExceptions catch (e) {
      return left(Failure(e.toString()));
    }
  }

  /// "AuthRepositoryImplementation" Auth Session class which is implemented from the "AuthRepository" class
  @override
  Future<Either<Failure, supabase.Session>> getAuthSession() async {
    try {
      if (!await (internetConnection.hasInternetAccess)) {
        final userSession = authSupabaseDataSource.getCurrentUserSession;
        if (userSession == null) {
          return left(Failure('User is not logged in'));
        }
        return right(userSession);
      }

      /// get user Session data
      final userSession = authSupabaseDataSource.getCurrentUserSession;
      if (userSession == null) {
        return left(Failure('User is not logged in'));
      }

      return right(userSession);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }

  /// "AuthRepositoryImplementation" Signout class which is implemented from the "AuthRepository" class
  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      await authSupabaseDataSource.signOut();
      return right('logout');
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }

  ///
}
