import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/gen/assets.gen.dart';
import 'package:home_decor/utils/utils.dart';
import 'package:home_decor/view/auth/sign_up_view.dart';
import 'package:home_decor/view/home/home_view.dart';
import 'package:home_decor/widget/widget.dart';
import 'forgot_password_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: AppText(
            text: "Log In",
            textStyle: AppTextStyle.h2.copyWith(color: AppColors.salmon),
          ),
        ),
        body: Padding(
          padding: AppPadding.normal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: "Welcome", textStyle: AppTextStyle.h2),
              SpaceHeight(10.0),
              AppText(text: "Please enter your details to proceed."),
              SpaceHeight(60.0),
              AppForm(
                title: "Username Or Email",
                hintText: "example@example.com",
              ),
              SpaceHeight(15.0),
              AppForm(
                isPassword: true,
                title: "Password",
                withHintPassword: true,
              ),
              SpaceHeight(30.0),
              Center(
                child: Column(
                  children: [
                    AppButton.filled(
                      onPressed: () => Get.offAll(HomeView()),
                      label: "Log In",
                      width: Get.width / 2,
                    ),
                    SpaceHeight(20.0),
                    GestureDetector(
                      onTap: () => Get.to(ForgotPasswordView()),
                      behavior: HitTestBehavior.translucent,
                      child: AppText(
                        text: "Forgot Password?",
                        textStyle: AppTextStyle.regularStyle.copyWith(
                          fontWeight: AppTextStyle.semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    AppText(text: "or sign up with"),
                    SpaceHeight(15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.0,
                      children: [
                        Assets.icons.icFacebook.svg(),
                        Assets.icons.icGoogle.svg(),
                      ],
                    ),
                    SpaceHeight(15.0),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppTextStyle.regularStyle,
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: AppTextStyle.regularStyle.copyWith(
                              color: AppColors.terracotta,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(SignUpView()),
                          ),
                        ],
                      ),
                    ),
                    SpaceHeight(30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
