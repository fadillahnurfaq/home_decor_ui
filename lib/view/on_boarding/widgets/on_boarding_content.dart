import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_style.dart';
import '../../../widget/widget.dart';

class OnBoardingContent extends StatelessWidget {
  final String imagePath, title;

  const OnBoardingContent({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: Get.height / 1.9,
              decoration: BoxDecoration(
                color: AppColors.beige,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
            Image.asset(
              imagePath,
              height: Get.height / 2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SpaceHeight(40.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              AppText(
                text: title,
                textStyle: AppTextStyle.h1.copyWith(
                  color: AppColors.salmon,
                  fontSize: 28.0,
                ),
              ),
              SpaceHeight(20.0),
              AppText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                align: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
