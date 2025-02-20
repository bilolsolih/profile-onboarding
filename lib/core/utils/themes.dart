import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.redPinkMain,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    fontFamily: "Poppins",
    colorScheme: AppColors.lightColorScheme,
  );
}
