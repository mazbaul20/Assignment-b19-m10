import 'package:flutter/material.dart';

OutlineInputBorder customBorder({required Color color, double width = 0}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: width),
  );
}
