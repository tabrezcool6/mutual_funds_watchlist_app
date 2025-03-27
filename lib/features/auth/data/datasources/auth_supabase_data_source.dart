import 'package:mutual_funds_watchlist/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// STEP 3 - Data layer
// creating a interface for the datasource
// so that when ever we shift to other database, only this funtion must bear the changes and not other
abstract interface class AuthSupabaseDataSource {
  //
  Future<void> signInWithPhone({required String phone});

  Future<void> verifyOtp({required String phone, required String otp});

  Session? get getCurrentUserSession;

  Future<void> signOut();
}

// STEP 4 - Implementing DataSource
// creating a general implements class which implements above "DATA SOURCE" class
// So that that it must contain the above two methods
class AuthSupabaseDataSourceImplementation implements AuthSupabaseDataSource {
  // asking "SUPABASECLIENT" from a constructor
  // We are not initializing supabase client here beacause by doing so, it creates a dependancy between impl class and supabase which we don't want
  // so that if we change database in future, we just get that database client from a cunstructor but not initializing the whole stuff again
  final SupabaseClient supabaseClient;
  AuthSupabaseDataSourceImplementation(this.supabaseClient);

  //
  @override
  Session? get getCurrentUserSession => supabaseClient.auth.currentSession;

  // User sign in method using supabase server api call
  @override
  Future<void> signInWithPhone({required String phone}) async {
    try {
      await supabaseClient.auth.signInWithOtp(phone: phone);
    }
    // handeling various exceptions
    on AuthException catch (e) {
      throw ServerExceptions(e.message);
    } on ServerExceptions catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  // User sign in method using supabase server api call
  @override
  Future<void> verifyOtp({required String phone, required String otp}) async {
    try {
      await supabaseClient.auth.verifyOTP(
        phone: phone,
        token: otp,
        type: OtpType.sms,
      );
    }
    // handeling various exceptions
    on AuthException catch (e) {
      throw ServerExceptions(e.message);
    } on ServerExceptions catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  // sign out function using supabase server api call
  @override
  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
