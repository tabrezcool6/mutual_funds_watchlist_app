import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void checkSession(Session? session) {
    if (session == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn());
    }
  }
}
