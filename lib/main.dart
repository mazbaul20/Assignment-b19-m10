import 'package:assignment_b19_m10/presentation/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'core/custom_border.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.cardColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: customBorder(color: AppColors.primary, width: 1.5),
          enabledBorder: customBorder(color: AppColors.primary, width: 1.5),
          focusedBorder: customBorder(color: AppColors.primary, width: 1.5),
          errorBorder: customBorder(color: AppColors.error),
          focusedErrorBorder: customBorder(color: AppColors.error, width: 1.5),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
