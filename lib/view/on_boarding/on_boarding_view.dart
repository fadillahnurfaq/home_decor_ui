import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/gen/assets.gen.dart';
import 'package:home_decor/service/local/local_service.dart';
import 'package:home_decor/utils/app_style.dart';
import 'package:home_decor/view/initial_view.dart';
import 'package:home_decor/view/on_boarding/widgets/on_boarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widget/widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final PageController _pageController;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

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
        child: Padding(
          padding: EdgeInsets.only(bottom: 80.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                isLastPage = value == 3;
              });
            },
            children: [
              OnBoardingContent(
                imagePath: Assets.images.intro1.path,
                title: "Cpnfortable Space",
              ),
              OnBoardingContent(
                imagePath: Assets.images.intro2.path,
                title: "Modern Design",
              ),
              OnBoardingContent(
                imagePath: Assets.images.intro3.path,
                title: "Styled Living",
              ),
              OnBoardingContent(
                imagePath: Assets.images.intro4.path,
                title: "Relaxing Furniture",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              onDotClicked: (index) => _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
              effect: ExpandingDotsEffect(
                dotColor: AppColors.beige,
                activeDotColor: AppColors.salmon,
                dotHeight: 10.0,
              ),
            ),
            AppButton.filled(
              onPressed: () async {
                if (!isLastPage) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Get.to(InitialView());
                  await LocalService.setSkipIntroduction();
                }
              },
              label: isLastPage ? "Get Started" : "Next",
              width: Get.width / 2.2,
            ),
          ],
        ),
      ),
    );
  }
}
