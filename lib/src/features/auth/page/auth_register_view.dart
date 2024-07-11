import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_demo/src/core/const/app_colors/app_colors.dart';
import 'package:social_media_demo/src/core/const/app_strings/app_strings.dart';
import 'package:social_media_demo/src/core/extension/validation_extension.dart';
import 'package:social_media_demo/src/features/auth/cubit/auth_cubit.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/label_text.dart';

class AuthRegisterView extends StatelessWidget {
  const AuthRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Expanded(
      child: Form(
        key: authCubit.formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child:
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      if (state is LoadingState) {

                          return const Center(
                              child: CircularProgressIndicator());

                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const LabelText(title: AppString.email),
                    const SizedBox(height: 6),
                    AppTextField(
                      textEditingController: authCubit.emailCtrl,
                      hintText: AppString.emailHint,
                      validator: (val) {
                        if (!val!.isValidEmail) {
                          return AppString.emailErr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const LabelText(title: AppString.createPassword),
                    const SizedBox(height: 6),
                    AppTextField(
                      textEditingController: authCubit.passwordCtrl,
                      hintText: AppString.passwordHint,
                      validator: (val) {
                        if (val!.length < 8) {
                          return AppString.passwordErr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const LabelText(title: AppString.confirmPassword),
                    const SizedBox(height: 6),
                    AppTextField(
                      textEditingController: authCubit.confirmPasswordCtrl,
                      hintText: AppString.repeatPassword,
                      validator: (p0) {
                        if (authCubit.confirmPasswordCtrl.text !=
                            authCubit.passwordCtrl.text) {
                          return AppString.confirmPasswordErr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    AppButton(
                      title: AppString.signUp,
                      color: AppColors.loginBtn,
                      onTap: () => authCubit.onClickSignUp(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
