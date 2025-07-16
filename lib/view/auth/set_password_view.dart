import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/utils/utils.dart';
import '../../widget/widget.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            text: "Set Password",
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
                    AppText(
                      text: "Change The Password",
                      textStyle: AppTextStyle.h2,
                    ),
                    SpaceHeight(10.0),
                    AppText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    ),
                    SpaceHeight(30.0),
                    AppForm(
                      title: "Password",
                      withHintPassword: true,
                      isPassword: true,
                    ),
                    SpaceHeight(15.0),
                    AppForm(
                      title: "Confirm Password",
                      withHintPassword: true,
                      isPassword: true,
                    ),
                    SpaceHeight(30.0),
                    Center(
                      child: AppButton.filled(
                        onPressed: () {},
                        label: "Reset Password",
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
    );
  }
}
