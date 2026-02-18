import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double? height ;
  const DividerWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 5,
      width: screenWidth(context),
      color: ColorUtils.black.withOpacity(0.1),
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  final double? height ;
  const CustomDividerWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height:3,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: ColorUtils.red
          ),
        ),
        Container(
          height:20,
          width: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.white
          ),
          child: Container(
            height:10,
            width: 10,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.red
            ),
          ),
        ),

      ],
    );
  }
}
