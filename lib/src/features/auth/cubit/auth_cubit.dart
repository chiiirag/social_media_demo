import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/widgets/app_snackbar.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SupabaseClient _supabase;

  AuthenticationCubit(this._supabase) : super(AuthenticationInitial());

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changeAuthTab(int index) {
    if (index == 1) {
      _clearAuthDetail();
      emit(AuthLoginTab(tabIndex: index));
    } else {
      _clearAuthDetail();
      emit(AuthRegisterTab(tabIndex: index));
    }
  }

  void _clearAuthDetail() {
    emailCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();
  }

  Future<void> onClickSignUp() async {
    if (formKey.currentState!.validate()) {
      await signUpWithEmail();
    }
  }

  Future<void> onClickLogin() async {
    if (formKey.currentState!.validate()) {
      await signInWithEmail();
    }
  }

  Future<void> signUpWithEmail() async {
    try {
      emit(LoadingState());
      final email = emailCtrl.text;
      final password = passwordCtrl.text;
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (authResponse.user != null) {
        changeAuthTab(1);
      } else {
        SnackBarUtil.info(message: "Something went wrong");
      }
    } catch (e) {
      SnackBarUtil.info(message: "Something went wrong");
    }
  }

  Future<void> signInWithEmail() async {
    try {
      emit(LoadingState());

      final email = emailCtrl.text;
      final password = passwordCtrl.text;
      final authResponse = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (authResponse.user != null) {
        emit(NavigateToHome());
      } else {
        SnackBarUtil.info(message: "Something went wrong");
      }
    } catch (e) {
      SnackBarUtil.info(message: "Something went wrong");
    }
  }
}
