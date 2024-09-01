import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData().copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.darkText,
          fontSize: 14,
          fontFamily: "GalanoGrotesque",
        ),
        bodySmall: TextStyle(
          color: AppColors.darkText,
          fontSize: 12,
          fontFamily: "GalanoGrotesque",
        ),
        headlineSmall: TextStyle(
          color: AppColors.darkText,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        headlineMedium: TextStyle(
          color: AppColors.darkText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        labelSmall: TextStyle(
          color: AppColors.darkText,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        labelMedium: TextStyle(
          color: AppColors.darkText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        titleSmall: TextStyle(
          color: AppColors.darkText,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "GalanoGrotesque",
        ),
        titleMedium: TextStyle(
          color: AppColors.darkText,
          fontSize: 16,
          fontFamily: "GalanoGrotesque",
        ),
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: "GalanoGrotesque",
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontFamily: "GalanoGrotesque",
        ),
        bodyLarge: TextStyle(
          color: AppColors.darkText,
          fontSize: 14,
          fontFamily: "GalanoGrotesque",
        ),
        displayMedium: TextStyle(
          color: AppColors.darkText,
          fontSize: 12,
          fontFamily: "GalanoGrotesque",
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primary, size: 20),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        // foregroundColor: ApplicationColors.bgColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.background, shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.darkText,
        size: 32,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
        endIndent: 0,
        indent: 15,
        thickness: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.background,
          prefixIconColor: AppColors.primary,
          suffixIconColor: AppColors.primary,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.darkText,
      ));
}
