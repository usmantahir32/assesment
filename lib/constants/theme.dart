import 'package:flutter/material.dart';
import '../utils/size_config.dart';
import 'colors.dart';

class AppTheme {
  final ThemeData primaryTheme = ThemeData(
    textTheme: TextTheme(
      displaySmall: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.1),
      bodySmall: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.4),
      bodyMedium: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.6),
      bodyLarge: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.8),
      displayLarge: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 2),
      headlineSmall: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.2),
      headlineMedium: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.5),
      headlineLarge: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.8),
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
  getTheme() {
    return primaryTheme;
  }
}
