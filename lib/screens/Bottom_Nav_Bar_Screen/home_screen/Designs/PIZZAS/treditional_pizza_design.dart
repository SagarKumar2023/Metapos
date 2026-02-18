import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class TraditionalPizzaDesign extends StatelessWidget {
  final String productName;
  final String productDesc;
  final String productPrice;
  final String productImage ;
  const TraditionalPizzaDesign({super.key, required this.productName, required this.productDesc, required this.productPrice, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenWidth(context),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ColorUtils.black.withOpacity(0.2),width: 1),
                    // image: DecorationImage(image: AssetImage(productImage),fit: BoxFit.fill)
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(productImage),
                      ),
                    ),
                  ),

                ),
              ),
              HorizontalSpace(width: 4),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        text: productName,
                        fontSize: 18,
                        textAlign: TextAlign.start,
                        textColor: ColorUtils.black.withOpacity(0.85),
                        fontWeight: FontWeight.w700,
                      ),
                      VerticalSpace(height: 8),
                      MyText(
                        text: productDesc,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                        textColor: ColorUtils.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        softSwap: true,
                        overflow: TextOverflow.visible,
                      ),
                      VerticalSpace(height: 8),
                      MyText(
                        text: productPrice,
                        fontSize: 16,
                        textColor: ColorUtils.black.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        VerticalSpace(height: 10),
        DividerWidget(height: 1.2),
        VerticalSpace(height: 10),
      ],
    ) ;
  }
}
