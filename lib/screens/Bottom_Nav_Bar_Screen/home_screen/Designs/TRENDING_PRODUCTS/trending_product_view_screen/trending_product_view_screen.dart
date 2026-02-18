import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/TRENDING_PRODUCTS/trending_product_view_screen/variantSelectedSizeDesign.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

import 'VariantBaseSelector.dart';

class TrendingProductViewScreen extends StatefulWidget {
  const TrendingProductViewScreen({super.key});

  @override
  State<TrendingProductViewScreen> createState() => _TrendingProductViewScreenState();
}

class _TrendingProductViewScreenState extends State<TrendingProductViewScreen> {
  bool isChecked = false;

  Set<String> selectedAddOnsItems = {};

  final List<Map<String, dynamic>> addOnsOptions = [
    {'name': 'Anchovies', 'price': '\$2.00'},
    {'name': 'Avocado', 'price': '\$2.00'},
    {'name': 'Bacon', 'price': '\$2.00'},
    {'name': 'BBQ Sauce', 'price': '\$2.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      bottomSheet: Container(
        height: 80,
        padding: EdgeInsets.only(top: 10,bottom: 10,right: 14,left: 14),
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: ColorUtils.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: MyButton(
          buttonColor: Colors.red,
            navigateTo: (){},
            buttonName: 'Add To Cart \$21.00'),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            toolbarHeight: 0,
            backgroundColor: ColorUtils.black,
            expandedHeight: 250,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 250,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/pizza_view.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  height: 250,
                  padding: EdgeInsets.only(left: 12,right: 12,bottom: 40),
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: ColorUtils.black.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){Navigator.pop(context);},
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: ColorUtils.black.withOpacity(0.3), width: 0.7),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 6,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                ),
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(image: AssetImage('assets/icons/veg.png'),fit: BoxFit.fill)
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              text: 'Napoletana',
                              fontSize: 40,
                              textColor: ColorUtils.white,
                              softSwap: true,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              text: '\$17.00',
                              fontSize: 20,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate:SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Variant Size',
                            fontSize: 20,
                            textColor: ColorUtils.black,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.bold,
                          ),
                          VerticalSpace(height: 10),
                          VariantSizeSelector(),
                          VerticalSpace(height: 15),
                          MyText(
                            text: 'Variant Base',
                            fontSize: 20,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.w700,
                          ),
                          VerticalSpace(height: 10),
                          VariantBaseSelector(),
                          VerticalSpace(height: 25),
                          Row(
                            children: [
                              Expanded(child: DividerWidget(height: 1.3,)),
                              HorizontalSpace(width: 8),
                              MyText(
                                text: 'AddOns',
                                fontSize: 20,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w700,
                              ),
                              HorizontalSpace(width: 8),
                              Expanded(child: DividerWidget(height: 1.3,))
                            ],
                          ),
                          VerticalSpace(height: 15),


                          Column(
                            children: addOnsOptions.map((item) {
                              final String name = item['name'];
                              final String price = item['price'];
                              final bool isChecked = selectedAddOnsItems.contains(name);

                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isChecked) {
                                          selectedAddOnsItems.remove(name);
                                        } else {
                                          selectedAddOnsItems.add(name);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 15,top:3,bottom: 3),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorUtils.black.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            activeColor: ColorUtils.green,
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                if (value!) {
                                                  selectedAddOnsItems.add(name);
                                                } else {
                                                  selectedAddOnsItems.remove(name);
                                                }
                                              });
                                            },
                                          ),
                                          MyText(
                                            text: name,
                                            fontSize: 16,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Spacer(),
                                          MyText(
                                            text: price,
                                            fontSize: 16,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  VerticalSpace(height: 10),
                                ],
                              );
                            }).toList(),


                          ),
                          VerticalSpace(height: 80),
                        ],
                      ),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}
