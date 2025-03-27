import 'dart:async';

import 'package:mutual_funds_watchlist/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// STEP 1 - Domain Layer
// Create a Repository or Auth Class
// Here, this interface class force other classes which implements them to must have these two functions
abstract interface class AuthRepository {
  //
  // the outcome or the result of the signup class can be a succuess or a failure. To display error it is enclosed by the failure class
  // Either is the default method provided by fp_dart package to return SUCCESS or FAILURE outcome
  Future<Either<Failure, void>> signIn({required String phone});

  Future<Either<Failure, void>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<Either<Failure, Session>> getAuthSession();

  Future<Either<Failure, String>> signOut();
}
