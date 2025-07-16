import 'dart:async';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_decor/controller/home/home_controller.dart';
import 'package:home_decor/gen/assets.gen.dart';
import 'package:home_decor/service/product/product_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/product/product_model.dart';
import '../../utils/utils.dart';
import '../../widget/widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> adImagePaths = [
    Assets.images.ads1.path,
    Assets.images.ads1.path,
    Assets.images.ads1.path,
  ];
  final List<String> categoriesImagePaths = [
    Assets.icons.icLivingRoom.path,
    Assets.icons.icBedroom.path,
    Assets.icons.icDiningRoom.path,
    Assets.icons.icKitchenOff.path,
    Assets.icons.icOfficeOff.path,
  ];

  late List<Widget> _pages;

  late final PageController _pageController;

  Timer? _timer;

  final controller = Get.put(HomeController(productService: ProductService()));

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == adImagePaths.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      adImagePaths.length,
      (index) => Image.asset(adImagePaths[index], fit: BoxFit.cover),
    );
    _pageController = PageController();
    startTimer();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getAllProduct();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
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
        child: SafeArea(
          child: AppRefresher(
            onRefresh: controller.getAllProduct,
            child: CustomScrollView(
              physics: ScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppPadding.normal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Hi, Welcome Back",
                                    textStyle: AppTextStyle.h1.copyWith(
                                      color: AppColors.salmon,
                                    ),
                                  ),
                                  AppText(text: "Create spaces that bring joy"),
                                ],
                              ),
                            ),
                            SpaceWidth(10.0),
                            AppCard(
                              isCircleBorder: true,
                              backgroundColor: AppColors.salmon,
                              child: Icon(Icons.search, size: 30.0),
                            ),
                          ],
                        ),
                        SpaceHeight(20.0),
                        SizedBox(
                          height: 132.0,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: adImagePaths.length,
                            clipBehavior: Clip.antiAlias,
                            padEnds: false,

                            itemBuilder: (context, index) {
                              return _pages[index];
                            },
                          ),
                        ),
                        SpaceHeight(15.0),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            onDotClicked: (index) =>
                                _pageController.animateToPage(
                                  index,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                ),
                            effect: ExpandingDotsEffect(
                              dotColor: AppColors.salmon,
                              activeDotColor: AppColors.black,
                              dotHeight: 10.0,
                              strokeWidth: 100.0,
                            ),
                          ),
                        ),
                        SpaceHeight(30.0),
                        AppText(
                          text: "Caregories",
                          textStyle: AppTextStyle.h4.copyWith(
                            color: AppColors.terracotta,
                          ),
                        ),
                        SpaceHeight(15.0),
                        SizedBox(
                          height: 65.0,
                          child: ListView.separated(
                            itemCount: categoriesImagePaths.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SpaceWidth(15.0),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Obx(
                                () => AppCard(
                                  backgroundColor:
                                      controller.caregorieIndex.value == index
                                      ? AppColors.salmon
                                      : AppColors.beige,
                                  elevation: 0.0,
                                  height: 65.0,
                                  width: 65.0,
                                  onTap: () =>
                                      controller.setCategorieIndex(index),
                                  child: SvgPicture.asset(
                                    categoriesImagePaths[index],
                                    colorFilter: ColorFilter.mode(
                                      controller.caregorieIndex.value == index
                                          ? AppColors.terracotta
                                          : AppColors.brownRosy,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverPadding(
                  padding: AppPadding.normal,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Best Seller",
                          textStyle: AppTextStyle.h4.copyWith(
                            color: AppColors.terracotta,
                          ),
                        ),
                        SpaceHeight(15.0),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AppCard(
                              width: double.infinity,
                              backgroundColor: AppColors.salmon,
                              padding: EdgeInsets.all(
                                10.0,
                              ).copyWith(right: 160.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Kitchen Cart",
                                    textStyle: AppTextStyle.h4,
                                  ),
                                  SpaceHeight(10.0),
                                  AppText(
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                  ),
                                  SpaceHeight(10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppCard(
                                        backgroundColor: AppColors.white,
                                        radius: 50.0,
                                        height: 35.0,
                                        padding: AppPadding.horizonal,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors.salmon,
                                              size: 15.0,
                                            ),
                                            AppText(text: "4.5"),
                                          ],
                                        ),
                                      ),
                                      AppButton.filled(
                                        width: 100.0,
                                        height: 35.0,
                                        onPressed: () {},
                                        label: "Shop Now",
                                        color: AppColors.white,
                                        textStyle: AppTextStyle.regularStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0.0,
                              top: -30.0,
                              child: Assets.images.bestSeller.image(
                                height: 160.0,
                                width: 160.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SliverPadding(
                  padding: AppPadding.normal,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "New Collection",
                          textStyle: AppTextStyle.h4.copyWith(
                            color: AppColors.terracotta,
                          ),
                        ),
                        SpaceHeight(15.0),
                        Obx(
                          () => WidgetAnimator<List<ProductModel>>(
                            requestState: controller.productState.value,
                            successWidget: (result) {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: result?.length ?? 0,
                                physics: ScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 300.0,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 30.0,
                                    ),
                                itemBuilder: (context, index) {
                                  final product = result![index];

                                  return SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppCachedImage(
                                          width: Get.width / 2,
                                          height: 142.0,
                                          radius: 0.0,
                                          elevation: 0.0,
                                          url: product.imagePath,
                                          emptyWidget: Assets.images.noImage
                                              .image(fit: BoxFit.cover),
                                        ),
                                        SpaceHeight(10.0),
                                        AppText(
                                          text: product.name,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textStyle: AppTextStyle.h4,
                                        ),
                                        SpaceHeight(5.0),
                                        AppText(
                                          text:
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SpaceHeight(5.0),
                                        Underline(
                                          width: double.infinity,
                                          color: AppColors.salmon,
                                        ),
                                        SpaceHeight(10.0),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppText(
                                                text: "\$120.00",
                                                textStyle: AppTextStyle.h4
                                                    .copyWith(
                                                      color:
                                                          AppColors.terracotta,
                                                    ),
                                              ),
                                            ),
                                            AppCard(
                                              isCircleBorder: true,
                                              backgroundColor: AppColors.salmon,
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.favorite,
                                                color: AppColors.white,
                                                size: 20.0,
                                              ),
                                            ),
                                            SpaceWidth(10.0),
                                            AppCard(
                                              isCircleBorder: true,
                                              backgroundColor: AppColors.salmon,
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.white,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
      ),
    );
  }
}
