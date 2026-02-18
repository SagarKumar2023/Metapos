import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/PIZZAS/treditional_pizza_design.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class TraditionalPizzaDesignDisplayData extends StatelessWidget {
  const TraditionalPizzaDesignDisplayData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12,top: 12),
          child: MyText(
            text: 'Traditional Pizza',
            fontSize: 20,
            // textAlign: TextAlign.start,
            textColor: ColorUtils.black,
            softSwap: true,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.bold,
          ),
        ),

        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return TraditionalPizzaDesign(
                productName: 'BBQ Pizza',
                productDesc: 'Special sauce,bacon and egg.',
                productPrice: '\$ 12.00-\$18.00',
                productImage: 'assets/images/trending_pizza.jpg'
            ) ;
          },
        ),
      ],
    );
  }
}
