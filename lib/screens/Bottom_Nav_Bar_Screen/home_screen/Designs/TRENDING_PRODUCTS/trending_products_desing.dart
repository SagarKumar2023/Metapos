import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/TRENDING_PRODUCTS/trending_product_view_screen/trending_product_view_screen.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:scroll_indicator/scroll_indicator.dart';


class TrendingProductsDesign extends StatefulWidget {
  const TrendingProductsDesign({super.key});

  @override
  State<TrendingProductsDesign> createState() => _TrendingProductsDesignState();
}

class _TrendingProductsDesignState extends State<TrendingProductsDesign> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: 'Trending Products',
            fontSize: 25,
            textColor: ColorUtils.black,
            softSwap: true,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.w500,
          ),
          VerticalSpace(height: 5),
          CustomDividerWidget(),
          VerticalSpace(height: 10),
          SizedBox(
            height: 210,
            width: screenWidth(context),
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: TrendingProductViewScreen(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                    // Navigator.push(context,MaterialPageRoute(builder: (context) => TrendingProductViewScreen(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/trending_pizza.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        height: 200,
                        width: 200,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorUtils.black.withOpacity(0.3)
                        ),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(image: AssetImage('assets/icons/veg.png'),fit: BoxFit.fill)
                              ),
                            ),
                            VerticalSpace(height: 5),
                            MyText(
                              text: 'Napoletana',
                              fontSize: 20,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w600,
                            ),
                            Spacer(),
                            MyText(
                              text: '\$14.00 - \$22.00',
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          VerticalSpace(height: 10),
          ScrollIndicator(
            scrollController: scrollController,
            width:screenWidth(context),
            height: 6,
            indicatorWidth: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orangeAccent.withOpacity(0.5)),
            indicatorDecoration: BoxDecoration(
                color:  ColorUtils.black,
                borderRadius: BorderRadius.circular(10)),
          ),
          VerticalSpace(height: 10),
        ],
      ),
    );
  }
}
