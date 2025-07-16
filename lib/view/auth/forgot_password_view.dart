import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/utils/utils.dart';
import 'package:home_decor/view/auth/set_password_view.dart';
import '../../widget/widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            text: "Forgot Password",
            textStyle: AppTextStyle.h2.copyWith(color: AppColors.salmon),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding.normal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Reset Password?", textStyle: AppTextStyle.h2),
                  SpaceHeight(10.0),
                  AppText(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  ),
                  SpaceHeight(30.0),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: AppPadding.normal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceHeight(30.0),
                            AppForm(
                              title: "Enter You Email Address",
                              fillColor: AppColors.white,
                              hintText: "example@example.com",
                            ),
                            SpaceHeight(30.0),
                            Center(
                              child: AppButton.filled(
                                onPressed: () => Get.to(SetPasswordView()),
                                label: "Next",
                                width: Get.width / 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
