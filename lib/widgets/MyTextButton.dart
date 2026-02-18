import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextButton extends StatelessWidget {
  final String? buttonName;
  final Color? textColor;
  final VoidCallback navigateTo ;
  final FontWeight? fontWeight;
  final double? fontSize;
  const MyTextButton({
    super.key,
    this.buttonName,
    this.textColor,
    this.fontWeight,
    this.fontSize, required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){navigateTo();},
      child: Text(
        "$buttonName",
        style: GoogleFonts.playfair(
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            )),
      ),
    );
  }
}