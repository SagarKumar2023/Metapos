import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final String? titleText;
  final String? hintText;
  final Widget? preFixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color? fillColor;
  final int? maxLength ;
  final Function(String)? onChanged;
  final String? Function(String?)? validation;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool obscureText;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;

  const MyTextField({
    super.key,
    required this.controller,
    this.titleText,
    this.hintText,
    this.keyboardType,
    this.readOnly,
    this.maxLines,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    required this.borderRadius,
    this.preFixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validation,
    this.onChanged, this.maxLength, this.fillColor, this.enabledBorderColor, this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      onChanged: onChanged,
      cursorWidth: 1.8,
      cursorHeight: 17,
      validator: validation,
      obscureText: obscureText,
      controller: controller,
      onTap: onTap,
      style: GoogleFonts.playfair(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorUtils.colorBlack
          // color: ColorUtils.white,
        ),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        prefixIcon: preFixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        hintStyle:  TextStyle(fontSize: 14, color: ColorUtils.black),
        enabledBorder:OutlineInputBorder(
          borderSide:  BorderSide(color: enabledBorderColor??ColorUtils.black),
          borderRadius: BorderRadius.circular(borderRadius),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color:focusedBorderColor?? ColorUtils.black),
        ),
      ),
    );
  }
}

