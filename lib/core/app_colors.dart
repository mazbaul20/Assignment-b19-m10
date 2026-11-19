import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand & Primary Colors
  static const Color primary = Color(0xFF008080);
  static const Color primaryDark = Color(0xFF005A5A);
  static const Color primaryLight = Color(0xFFE0F2F1);

  // Background & Surface Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];

  // Text Colors
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);

  // Border & Divider Colors
  static const Color border = Color(0xFFDEE2E6);

  // Status & Action Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF198754);
}
