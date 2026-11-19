import 'package:assignment_b19_m10/presentation/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
