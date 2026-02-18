import 'package:google_fonts/google_fonts.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Specials_Deals_Hive_Model/Specials_Deals_Order/SpecialDealsOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/RazorpayService/RazorpayService.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_arrowBack_button_source.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/category_hold_multiple_orders_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/display_all_orders_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/half_and_half_hold_multiple_orders_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/submit_order_all_products.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MySnackbar.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'my_order_screen_ui/category_order_ui.dart';
import 'my_order_screen_ui/deals_order_ui.dart';
import 'my_order_screen_ui/half_and_hal_order_ui.dart';
import 'my_order_screen_ui/special_deal_order_ui.dart';
export 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
export 'package:metapos_sync_order_online_ofline/RazorpayService/RazorpayService.dart';
export 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
export 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
export 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
export 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Add_To_Cart/HalfAndHalfAddToCartHiveBoxModel.dart';
export 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/CategoryPriceController.dart';
export 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/HalfNHalfPriceController.dart';
export 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
export 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
export 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor:  Colors.blue,
            elevation: 5,
            surfaceTintColor: Colors.blue ,
            title: MyText(
              text: 'My Orders',
              fontSize: 20,
              // textAlign: TextAlign.start,
              textColor: ColorUtils.white,
              softSwap: true,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  SubmitOrderAllProducts.clearAllCartBoxes();
                },
                child: Icon(
                  Icons.search,
                  color: ColorUtils.white,
                ),
              ),
              HorizontalSpace(width: 10),

              GestureDetector(
                onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: CartScreen(source: CartScreenArrowbackButtonSource.showIcon,),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  color: ColorUtils.white,
                ),
              ),
              HorizontalSpace(width: 10),

            ],
          ),
          // List of items
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // DisplayAllOrdersUi(),
                        HalfAndHalfHoldMultipleOrderUi(),
                        VerticalSpace(height: 5),
                        // HalfAndHalfSingleOrderListUi for single product if user will be ordering the single product
                        HalfAndHalfHoldSingleOrderListUi(),
                        VerticalSpace(height: 5),
                        // CategoryOrderUi for single product if user will be ordering the single product
                        CategoryHoldSingleOrderListUi(),
                        VerticalSpace(height: 5),
                        CategoryHoldMultipleOrdersUi(),
                        VerticalSpace(height: 10),
                        DealsOrderUi(),
                        VerticalSpace(height: 10),
                        SpecialDealOrderUi(),
                        // VerticalSpace(height: 10),
                        VerticalSpace(height: 20)
                      ],
                    ),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
