import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/PIZZAS/treditional_pizza_design.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
class VeganPizzaDesign extends StatelessWidget {
  const VeganPizzaDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12,top: 12),
          child: MyText(
            text: 'Vegan Pizzas',
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
                productName: 'Supreme Vegetarian',
                productDesc: 'Special sauce,spinach cheese,semidried tomatoes capcicum,olives,onions,pineapple,mushrooms,and bacconncini cheese.',
                productPrice: '\$ 16.00',
                productImage: 'assets/images/pasta.jpg'
            ) ;
          },
        ),
      ],
    );
  }
}
