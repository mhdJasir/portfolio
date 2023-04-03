import 'package:flutter/material.dart';
import 'package:portfolio/helpers/app_colors.dart';

class ThemeHelper {
  final theme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Montserrat-Medium',
    scaffoldBackgroundColor: AppColors().primaryColor,
      primaryColor: AppColors().primaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors().textColor,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors().textColor,
          fontSize: 15,
        ),
        titleSmall: TextStyle(
            color: AppColors().textColor,
            fontSize: 12
        ),
        bodyLarge: TextStyle(
          color: AppColors().textColor,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: AppColors().textColor,
        ),
        bodySmall: TextStyle(
          color: AppColors().textLight,
          fontSize: 13,
        ),
        // bodyText1: TextStyle(
        //   color: AppColors().textColor,
        // ),
    //     bodyText2: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     displayLarge: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     displayMedium: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     displaySmall: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headline1: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headline2: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headline3: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headline4: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headline5: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headlineLarge: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headlineMedium: TextStyle(
    //       color: AppColors().textColor,
    //     ),
    //     headlineSmall: TextStyle(
    //       color: AppColors().textColor,
    //     ),
      ),
  );
}
