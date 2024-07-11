import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log("Bloc: ${bloc.runtimeType} ---Current: ${change.currentState.runtimeType}----Next: ${change.nextState.runtimeType}");
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("Bloc Created: ${bloc.runtimeType}");
    super.onCreate(bloc);
  }
}
