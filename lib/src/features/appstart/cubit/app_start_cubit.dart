import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/widgets/app_snackbar.dart';

part 'app_start_state.dart';

class AppStartCubit extends Cubit<AppStartState> {
  AppStartCubit(this._supabase) : super(AppStartInitial());
  late final StreamSubscription<AuthState> authStateSubscription;
  final SupabaseClient _supabase;

  void checkSession() {
    authStateSubscription = _supabase.auth.onAuthStateChange.listen(
      (data) {
        final session = data.session;
        if (session != null) {
          emit(NavigateToHome());
        }
      },
      onError: (error) {
        if (error is AuthException) {
        } else {
          SnackBarUtil.info(message: "Something went wrong");
        }
      },
    );
  }
}
