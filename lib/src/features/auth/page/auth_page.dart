import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/core/assets/app_assets.dart';
import 'package:social_media_demo/src/core/const/app_colors/app_colors.dart';
import 'package:social_media_demo/src/core/const/app_font/app_font.dart';
import 'package:social_media_demo/src/core/const/app_strings/app_strings.dart';
import 'package:social_media_demo/src/core/di.dart';
import 'package:social_media_demo/src/core/widgets/app_dialog.dart';
import 'package:social_media_demo/src/core/widgets/auth_tab.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';
import 'package:social_media_demo/src/features/auth/cubit/auth_cubit.dart';
import 'package:social_media_demo/src/features/home/cubit/home_page_cubit.dart';

import '../../../core/widgets/image_view.dart';
import '../../home/page/home_page.dart';
import 'auth_login_view.dart';
import 'auth_register_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationCubit(getIt()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationCubit>(context).changeAuthTab(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => HomePageCubit(getIt()),
                  child: const HomePage(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppAssets.appBackground,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 80, top: 20),
                    child: TextView(
                      AppString.welcome,
                      fontSize: 40,
                      textColor: AppColors.white,
                      fontFamily: AppFont.sfPro,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: AppColors.loginBackground,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 60),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: TextView(
                                  "My name is Catherine. I like dancing in the rain and travelling all around the world.",
                                  fontSize: 13,
                                  textColor: AppColors.textColor,
                                  fontFamily: AppFont.poppins,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 30),
                              BlocBuilder<AuthenticationCubit,
                                  AuthenticationState>(
                                builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthTab(
                                        title: AppString.login,
                                        isSelected: state is AuthLoginTab,
                                        onTap: () {
                                          context
                                              .read<AuthenticationCubit>()
                                              .changeAuthTab(1);
                                        },
                                      ),
                                      const SizedBox(width: 15),
                                      AuthTab(
                                        title: AppString.register,
                                        isSelected: state is AuthRegisterTab,
                                        onTap: () {
                                          context
                                              .read<AuthenticationCubit>()
                                              .changeAuthTab(2);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              BlocBuilder<AuthenticationCubit,
                                  AuthenticationState>(
                                builder: (context, state) {
                                  if (state is AuthLoginTab) {
                                    return const AuthLoginView();
                                  }
                                  return const AuthRegisterView();
                                },
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: -45,
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: const SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageView(imagePath: AppAssets.avtar),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
