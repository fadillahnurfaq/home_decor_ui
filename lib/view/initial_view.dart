import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/view/auth/login_view.dart';
import 'package:home_decor/view/auth/sign_up_view.dart';

import '../gen/assets.gen.dart';
import '../utils/app_style.dart';
import '../widget/widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: AppText(
            text: 'Tekan kembali lagi untuk keluar dari aplikasi',
            textStyle: AppTextStyle.h4.copyWith(color: AppColors.white),
          ),
          closeIconColor: Colors.white,
          backgroundColor: AppColors.salmon,
          showCloseIcon: true,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Assets.images.logo.image(height: Get.height / 3)),
            SpaceHeight(20.0),
            AppText(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
              align: TextAlign.center,
            ),
            SpaceHeight(20.0),
            AppButton.filled(
              onPressed: () => Get.to(LoginView()),
              label: "Log In",
              width: Get.width / 2,
              textStyle: AppTextStyle.h2.copyWith(color: AppColors.terracotta),
            ),
            SpaceHeight(20.0),
            AppButton.filled(
              onPressed: () => Get.to(SignUpView()),
              label: "Sign Up",
              width: Get.width / 2,
              color: AppColors.beige,
              textStyle: AppTextStyle.h2.copyWith(color: AppColors.brownRosy),
            ),
          ],
        ),
      ),
    );
  }
}
