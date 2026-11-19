import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(icon, size: 25),
          onPressed: onTap,
        ),
      ),
    );
  }
}
