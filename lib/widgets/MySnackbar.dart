import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class MySnackbar {
  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        textStyle:  GoogleFonts.vidaloka(
          textStyle: TextStyle(
            fontSize: 16,
            color: ColorUtils.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        message: message,
      ),
    );
  }
  static void showError({
    required BuildContext context,
    required String message,
  }) {
    showTopSnackBar(

      Overlay.of(context),
      CustomSnackBar.error(
        textAlign: TextAlign.start,
        textStyle:  GoogleFonts.vidaloka(
          textStyle: TextStyle(
            fontSize: 16,
            color: ColorUtils.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        message: message,
      ),
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        textStyle:  GoogleFonts.vidaloka(
          textStyle: TextStyle(
            fontSize: 16,
            color: ColorUtils.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        message: message,
      ),
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        textStyle:  GoogleFonts.vidaloka(
          textStyle: TextStyle(
            fontSize: 16,
            color: ColorUtils.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        message: "⚠️ $message",
        backgroundColor: Colors.orange,
      ),
    );
  }
}
