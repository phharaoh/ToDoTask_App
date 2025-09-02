import 'color.dart';
import 'package:flutter/material.dart';
// ignore: file_names

abstract class ElvatbuttonStyle {
  static ButtonStyle buttonStyle = ButtonStyle(
    elevation: const WidgetStatePropertyAll(4),
    shadowColor: const WidgetStatePropertyAll(Colors.black),
    backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
    ),
  );
}
