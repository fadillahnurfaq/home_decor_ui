import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/utils/app_style.dart';
import 'package:home_decor/view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Decor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 0.0,
        ),
      ),
      home: const SplashView(),
    );
  }
}
