import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class MyText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? textTwoColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final bool? softSwap;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final Color? decorationColor ;
  const MyText({
    super.key,
    this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textTwoColor,
    this.textAlign = TextAlign.start, this.overflow, this.softSwap, this.maxLine, this.textDecoration, this.decorationColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine,
      "$text",
      softWrap: softSwap,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.vidaloka(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            decoration: textDecoration,
              decorationColor:decorationColor?? Colors.black.withOpacity(0.8),

          ),
      ),
    );
  }
}



class MyRichText extends StatelessWidget {
  final String? textOne;
  final String? textTwo;
  final String? textThree;
  final String? textFour;
  final Color? textColor;
  final Color? textTwoColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;


  const MyRichText({
    super.key,
    this.textOne,
    this.textTwo,
    this.textThree,
    this.textColor,
    this.textTwoColor,
    this.fontWeight,
    this.fontSize, this.textFour, this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
        children: <InlineSpan>[
          if (textOne != null)
            TextSpan(
              text: textOne,
              /// GoogleFonts.montserrat
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
          if (textTwo != null)
            TextSpan(
              text: textTwo,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textTwoColor,
                ),
              ),
            ),
          if (textThree != null)
            TextSpan(
              text: textThree,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ScrollingTextWidget extends StatelessWidget {
  final String text ;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize ;

  ScrollingTextWidget({required this.text, required this.textColor, required this.fontWeight, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Marquee(
        text: text,
        style:  GoogleFonts.teko(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 50.0,
        velocity: 30.0, // Speed of the scrolling text
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}



class CommonKhandText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  const CommonKhandText({
    super.key,
    this.title,
    this.textColor,
    this.fontWeight,
    this.fontSize, this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: textAlign,
      style: GoogleFonts.playfairDisplay(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          )),
    );
  }
}
