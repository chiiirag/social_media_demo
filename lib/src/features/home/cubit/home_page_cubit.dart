import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final SupabaseClient _supabase;

  HomePageCubit(this._supabase) : super(HomePageInitial());

  Future<void> signOut() async {
    emit(IsLoadingState());
    await _supabase.auth.signOut().then((value) => emit(NavigateToAuth()));
  }

  int selectedIndex = 0;

  void setTab(int index) {
    selectedIndex = index;
    emit(UpdateIndex(index));
  }
}
