import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/utils/utils.dart';
import 'package:home_decor/view/auth/login_view.dart';
import '../../widget/widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            text: "Create Account",
            textStyle: AppTextStyle.h2.copyWith(color: AppColors.salmon),
          ),
        ),
        body: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.normal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppForm(title: "Full Name"),
                    SpaceHeight(15.0),
                    AppForm(title: "Email"),
                    SpaceHeight(15.0),
                    AppForm(title: "Mobile Number"),
                    SpaceHeight(15.0),
                    AppForm(title: "Date Of Birth"),
                    SpaceHeight(15.0),
                    AppForm(title: "Password"),
                    SpaceHeight(15.0),
                    AppForm(title: "Confirm Password"),
                    SpaceHeight(20.0),
                    Center(
                      child: Column(
                        children: [
                          AppText(text: "By continuing, you agree to"),
                          RichText(
                            text: TextSpan(
                              text: "Terms of Use ",
                              style: AppTextStyle.regularStyle.copyWith(
                                fontWeight: AppTextStyle.semiBold,
                              ),
                              children: [
                                TextSpan(
                                  text: "and",
                                  style: AppTextStyle.regularStyle,
                                ),
                                TextSpan(
                                  text: " Privacy Policy.",
                                  style: AppTextStyle.regularStyle.copyWith(
                                    fontWeight: AppTextStyle.semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpaceHeight(10.0),
                          AppButton.filled(
                            onPressed: () {},
                            label: "Sign Up",
                            width: Get.width / 2,
                          ),
                          SpaceHeight(15.0),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: AppTextStyle.regularStyle,
                              children: [
                                TextSpan(
                                  text: "Log in",
                                  style: AppTextStyle.regularStyle.copyWith(
                                    color: AppColors.terracotta,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(LoginView()),
                                ),
                              ],
                            ),
                          ),
                        ],
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
