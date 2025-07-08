import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/service/local/local_service.dart';
import 'package:home_decor/utils/app_style.dart';
import 'package:home_decor/view/initial_view.dart';
import 'package:home_decor/view/on_boarding/on_boarding_view.dart';
import '../gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LocalService.getSkipIntroduction().then((skipped) {
        if (skipped) {
          Get.off(InitialView());
        } else {
          Get.off(OnBoardingView());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.salmon,
      body: Center(
        child: Assets.images.logo.image(
          height: Get.height / 3,
          color: AppColors.white,
        ),
      ),
    );
  }
}
