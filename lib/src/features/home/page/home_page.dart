import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/core/const/app_colors/app_colors.dart';
import 'package:social_media_demo/src/core/const/constant/constant.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';
import 'package:social_media_demo/src/features/auth/cubit/auth_cubit.dart';
import 'package:social_media_demo/src/features/chat/page/chat_page.dart';
import 'package:social_media_demo/src/features/home/cubit/home_page_cubit.dart';

import '../../../core/di.dart';
import '../../auth/page/auth_page.dart';
import '../../profile/page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomList = AppConstant.bottomList;

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomePageCubit>(context);
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is UpdateIndex) {
            switch (state.index) {
              case 0:
                return const Center(child: TextView("1"));
              case 1:
                return const ChatPage();
              case 3:
                return const ProfilePage();
              default:
                return const TextView("Default");
            }
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: homeCubit.selectedIndex,
            onTap: (index) => context.read<HomePageCubit>().setTab(index),
            items: bottomList
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(
                      e.iconData,
                      color: AppColors.loginBtn,
                    ),
                    label: e.label,
                    activeIcon: Icon(
                      e.iconData,
                      color: AppColors.black,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
    return Scaffold(
      body: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          if (state is NavigateToAuth) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => AuthenticationCubit(getIt()),
                  child: const LoginPage(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is IsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<HomePageCubit>(context).signOut(),
        child: const TextView("adidas"),
      ),
    );
  }
}
