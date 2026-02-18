import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';

class SnackBarUtils {
  static void showWarning(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: ColorUtils.red,
      colorText: ColorUtils.white.withOpacity(0.9),
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
    );
  }

  static void showSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: ColorUtils.green,
      colorText: ColorUtils.white.withOpacity(0.9),
      margin:  EdgeInsets.only(top: 5, left: 10, right: 10),
    );
  }

  static void showInfo(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: ColorUtils.white.withOpacity(0.9),
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
    );
  }
}
