import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
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

class MyOrderSeeAllUpdate extends StatefulWidget {
  const MyOrderSeeAllUpdate({super.key,});

  @override
  State<MyOrderSeeAllUpdate> createState() => _MyOrderSeeAllUpdateState();
}

class _MyOrderSeeAllUpdateState extends State<MyOrderSeeAllUpdate> {

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ColorUtils.white,
              ),
            ),
            backgroundColor:  Colors.blue,
            elevation: 5,
            surfaceTintColor: Colors.blue,
            // title: MyText(
            //   text: 'Order details',
            //   fontSize: 20,
            //   // textAlign: TextAlign.start,
            //   textColor: ColorUtils.white,
            //   softSwap: true,
            //   overflow: TextOverflow.visible,
            //   fontWeight: FontWeight.w500,
            // ),
            actions: [
              GestureDetector(
                onTap: (){

                },
                child: Icon(
                  Icons.search,
                  color: ColorUtils.white,
                ),
              ),
              HorizontalSpace(width: 10),

              GestureDetector(
                onTap: (){

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
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderTracker(
                            status: Status.delivered,
                            activeColor: Colors.green,
                            headingDateTextStyle: GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:ColorUtils.black.withOpacity(0.7),
                              ),
                            ),
                            headingTitleStyle:  GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black.withOpacity(0.7),
                              ),
                            ),
                            subDateTextStyle: GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black.withOpacity(0.6),
                              ),
                            ),
                            subTitleTextStyle: GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.black.withOpacity(0.6),
                              ),
                            ),
                            inActiveColor: Colors.grey[300],
                            orderTitleAndDateList: orderList,
                            shippedTitleAndDateList: shippedList,
                            outOfDeliveryTitleAndDateList: outOfDeliveryList,
                            deliveredTitleAndDateList: deliveredList,
                          )
                        ]
                      ),
                    )
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
