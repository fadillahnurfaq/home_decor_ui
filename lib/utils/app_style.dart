import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;

  static final String? poppins = GoogleFonts.poppins().fontFamily;
  static final String? leagueSpartan = GoogleFonts.leagueSpartan().fontFamily;

  static TextStyle h1 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 22,
    fontWeight: bold,
    height: 1.2,
    fontFamily: poppins,
  );
  static TextStyle h2 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 20,
    fontWeight: bold,
    height: 1.2,
    fontFamily: poppins,
  );
  static TextStyle h3 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 18,
    fontWeight: bold,
    height: 1.2,
    fontFamily: poppins,
  );
  static TextStyle h4 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.2,
    fontFamily: poppins,
  );

  static TextStyle regularStyle = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 14,
    fontWeight: regular,
    height: 1.2,
    fontFamily: leagueSpartan,
  );
}

class AppColors {
  AppColors._();

  static const Color salmon = Color(0xFFF4B5A4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF363130);
  static const Color terracotta = Color(0xFFCC7861);
  static const Color brownRosy = Color(0xFFDCBEB6);
  static const Color beige = Color(0xFFFAF0E6);
  static const Color red = Color(0xFFFF0032);
}

class AppPadding {
  static const EdgeInsets horizonal = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets normal = EdgeInsets.all(16.0);
}
