import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DealsDesign extends StatelessWidget {
  final String dealName;
  final String dealDesc;
  final String dealPrice ;
  const DealsDesign({super.key, required this.dealName, required this.dealDesc, required this.dealPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DividerWidget(height: 1.2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DottedBorder(
            strokeWidth: 1.5,
            dashPattern: [3,2],
            radius: Radius.circular(12),
            borderType: BorderType.RRect,
            // padding: const EdgeInsets.only(left: 20,top: 12,bottom: 12,right: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 12,top: 10,bottom: 10,right: 15),
              decoration: BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.circular(11),
              ),
              width: screenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: dealName,
                    fontSize: 18,
                    textColor: ColorUtils.black.withOpacity(0.85),
                    softSwap: true,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.bold,
                  ),
                  VerticalSpace(height: 5),
                  MyText(
                    text: dealPrice,
                    fontSize: 16,
                    textColor: ColorUtils.black.withOpacity(0.85),
                    fontWeight: FontWeight.bold,
                  ),
                  VerticalSpace(height: 10),
                  MyText(
                    text: dealDesc,
                    fontSize: 15,
                    textColor: ColorUtils.black.withOpacity(0.85),
                    fontWeight: FontWeight.w400,
                  ),
                  VerticalSpace(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
