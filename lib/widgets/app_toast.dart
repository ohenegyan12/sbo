import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/app_colors.dart';

class AppToast {
  static void show({
    required String message,
    Color? backgroundColor,
    Color? textColor,
    double fontSize = 16.0,
    ToastGravity gravity = ToastGravity.TOP,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? AppColors.darkBackground.withOpacity(0.8),
      textColor: textColor ?? Colors.white,
      fontSize: fontSize,
    );
  }

  static void success(String message) {
    show(
      message: message,
      backgroundColor: Colors.green.shade600,
    );
  }

  static void error(String message) {
    show(
      message: message,
      backgroundColor: Colors.red.shade600,
    );
  }

  static void info(String message) {
    show(
      message: message,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
