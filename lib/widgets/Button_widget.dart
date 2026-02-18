import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';


class MyButton extends StatelessWidget {
  final VoidCallback navigateTo;
  final double? radius ;
  final String buttonName;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final double? fontsize;
  final EdgeInsetsGeometry? margin;
  const MyButton({
    super.key,
    required this.navigateTo,
    required this.buttonName,
    this.margin,
    this.height,
    this.width,
    this.buttonColor,
    this.fontsize, this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      margin: margin,
      width: width ?? screenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??45),
      ),
      child: ElevatedButton(
        onPressed: () {
          navigateTo();
        },
        style: ElevatedButton.styleFrom(
            surfaceTintColor: buttonColor ?? ColorUtils.green,
            elevation: 0,
            backgroundColor: buttonColor ?? ColorUtils.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius??45),
            )
        ),
        child: Text(
          buttonName,
          style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                  color: ColorUtils.white,
                  fontSize: fontsize??16
              )
          ),
        ),
      ),
    );
  }
}
