import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(fontSize: 26.5, fontWeight: FontWeight.w500),
      titleMedium: const TextStyle(fontSize: 25.0),
      titleSmall: const TextStyle(fontSize: 20.0),
      bodyMedium: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: AppColors.hint,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.hint,
      selectedItemColor: AppColors.primary,
    ),
  );
}
