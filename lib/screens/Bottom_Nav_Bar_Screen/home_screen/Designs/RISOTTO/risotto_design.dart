import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/PIZZAS/treditional_pizza_design.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class RisottoDesign extends StatelessWidget {
  const RisottoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
          child: MyText(
            text: 'RISOTTO',
            fontSize: 20,
            // textAlign: TextAlign.start,
            textColor: ColorUtils.black,
            softSwap: true,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.bold,
          ),
        ),
        DividerWidget(height: 1.5,),
        VerticalSpace(height: 5),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return TraditionalPizzaDesign(
                productName: 'Chicken',
                productDesc: 'Chicken,pine nuts and spinach and cream sauce with arborio rice',
                productPrice: '\$ 55.00',
                productImage: 'assets/images/chicken.jpg'
            ) ;
          },
        ),
      ],
    );
  }
}
