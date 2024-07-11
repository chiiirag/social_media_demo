import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/core/const/app_strings/app_strings.dart';
import 'package:social_media_demo/src/core/di.dart';
import 'package:social_media_demo/src/features/appstart/cubit/app_start_cubit.dart';
import 'package:social_media_demo/src/features/appstart/view/app_start.dart';
import 'package:social_media_demo/src/features/home/cubit/home_page_cubit.dart';
import 'package:social_media_demo/src/features/profile/cubit/profile_cubit.dart';

import 'features/chat/cubit/chat_cubit.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppStartCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => HomePageCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AppStart(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: AppString.appName,
      ),
    );
  }
}
