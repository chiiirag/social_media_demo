import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/app_bloc_observer.dart';
import 'package:social_media_demo/src/app_view.dart';
import 'package:social_media_demo/src/core/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await injectDependency();
  runApp(const AppView());
}
