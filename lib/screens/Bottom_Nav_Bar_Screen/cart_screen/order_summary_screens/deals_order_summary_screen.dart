
import 'package:google_fonts/google_fonts.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Deals_Hive_Model/Deals_Order/DealsOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/RazorpayService/RazorpayService.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MySnackbar.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
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

class DealsOrderSummaryScreen extends StatefulWidget {
  final String dealName ;
  final String dealPrice ;
  final String dealTotalPrice ;
  final List<String?> dealFoodName ;
  final List<String?> dealCategory ;
  final int dealQty;
  final List<String?> dealNoOfItem;
  final String dealId;
  final String dealDesc ;

  const DealsOrderSummaryScreen({super.key, required this.dealName, required this.dealPrice, required this.dealTotalPrice, required this.dealFoodName, required this.dealCategory, required this.dealQty, required this.dealNoOfItem, required this.dealId, required this.dealDesc,});

  @override
  State<DealsOrderSummaryScreen> createState() => _DealsOrderSummaryScreenState();
}

class _DealsOrderSummaryScreenState extends State<DealsOrderSummaryScreen> {


  final RazorpayService razorpayService = RazorpayService();

  List<int> quantities = [];

  String selectedPayment = 'Pay at Counter';

  // final BouquetsPriceController cartController = BouquetsPriceController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(selectedPayment == 'Online Payment')
                MyButton(
                    height: 50,
                    radius: 12,
                    buttonColor: Colors.red,
                    navigateTo: () {

                      razorpayService.openCheckout(
                        orderId: widget.dealId.toString(),
                        name: "Sagar kumar",
                        contact: "7295992604",
                        email: "metapos.in",
                        amount: double.parse(widget.dealTotalPrice),
                        desc: 'Metapos',
                      );
                    },
                    buttonName: 'Pay Securely \$ ${widget.dealTotalPrice}'
                )
              else if (selectedPayment == 'Pay at Counter')
                MyButton(
                    radius: 12,
                    height: 50,
                    buttonColor: Colors.red,
                    navigateTo: (){
                      final dealsAddToCartBox = HiveBoxes.dealsAddToCartDB();
                      final dealsOrderBox = HiveBoxes.dealsHoldSingleOrderListDB();

                      final model = DealsHoldSingleOrderListDBModel(
                          dealName: widget.dealName,
                          dealPrice: widget.dealPrice,
                          dealQty: widget.dealQty,
                          dealTotalPrice: widget.dealTotalPrice,
                          dealNoOfItem: widget.dealNoOfItem,
                          dealId:widget.dealId,
                          dealFoodName: widget.dealFoodName,
                          dealCategory: widget.dealCategory,
                          dealDesc: widget.dealDesc
                      );
                      dealsOrderBox.add(model);
                      final keyToDelete = dealsAddToCartBox.keys.firstWhere((key) => dealsAddToCartBox.get(key)?.dealId == widget.dealId ,orElse: () => null,);
                      if(keyToDelete != null){
                        dealsAddToCartBox.delete(keyToDelete);
                      }
                      Navigator.pop(context);

                      MySnackbar.showSuccess(
                        context: context,
                        message: "Your order has been confirmed.",
                      );
                    },
                    buttonName: 'Continue \$ ${widget.dealTotalPrice}'
                )
            ],
          )
      ),
      // bottomSheet: Container(
      //     height: 80,
      //     padding: EdgeInsets.only(top: 10,bottom: 10,right: 14,left: 15),
      //     width: screenWidth(context),
      //     decoration: BoxDecoration(
      //       color: ColorUtils.white,
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.grey.withOpacity(0.5),
      //           spreadRadius: 1,
      //           blurRadius: 6,
      //           offset: Offset(0, -3),
      //         ),
      //       ],
      //     ),
      //
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MyText(
      //               text: '\$ 2488',
      //               fontSize: 12,
      //               // textAlign: TextAlign.start,
      //               textColor: ColorUtils.black.withOpacity(0.5),
      //               softSwap: true,
      //               overflow: TextOverflow.visible,
      //               fontWeight: FontWeight.bold,
      //               textDecoration: TextDecoration.lineThrough,
      //             ),
      //             MyText(
      //               text: '\$ ${widget.dealTotalPrice}',
      //               fontSize: 16,
      //               // textAlign: TextAlign.start,
      //               textColor: ColorUtils.black,
      //               softSwap: true,
      //               overflow: TextOverflow.visible,
      //               fontWeight: FontWeight.w500,
      //             ),
      //             MyText(
      //               text: 'View price details',
      //               fontSize: 14,
      //               // textAlign: TextAlign.start,
      //               textColor: ColorUtils.blue,
      //               softSwap: true,
      //               overflow: TextOverflow.visible,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ],
      //         ),
      //         MyButton(
      //             height: 45,width: 200,
      //             radius: 5,
      //             buttonColor: Colors.red,
      //             navigateTo: (){
      //               // razorpayService.openCheckout(
      //               //     name: "Sagar kumar",
      //               //     contact: "7295992604",
      //               //     email: "info@papayacoders.in",
      //               //     amount: 299.00,
      //               //     desc: 'Android Course'
      //               // );
      //
      //               final dealsAddToCartBox = HiveBoxes.dealsAddToCartHiveBox();
      //               final dealsOrderBox = HiveBoxes.dealsOrderHiveBox();
      //
      //               final model = DealsOrderHiveBoxModel(
      //                   dealName: widget.dealName,
      //                   dealPrice: widget.dealPrice,
      //                   dealQty: widget.dealQty,
      //                   dealTotalPrice: widget.dealTotalPrice,
      //                   dealNoOfItem: widget.dealNoOfItem,
      //                   dealId:widget.dealId,
      //                   dealFoodName: widget.dealFoodName,
      //                   dealCategory: widget.dealCategory,
      //                 dealDesc: widget.dealDesc
      //               );
      //               dealsOrderBox.add(model);
      //
      //               final keyToDelete = dealsAddToCartBox.keys.firstWhere((key) => dealsAddToCartBox.get(key)?.dealId == widget.dealId ,orElse: () => null,);
      //               if(keyToDelete != null){
      //                 dealsAddToCartBox.delete(keyToDelete);
      //               }
      //               Navigator.pop(context);
      //
      //               MySnackbar.showSuccess(
      //                 context: context,
      //                 message: "Your order has been confirmed.",
      //               );
      //             },
      //             buttonName: 'Continue')
      //       ],
      //     )
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            toolbarHeight: 0,
            backgroundColor: ColorUtils.white,
            expandedHeight: 190.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 190,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(25),
                  //   bottomLeft: Radius.circular(25),
                  // ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/pizza.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  height: 190,
                  width: screenWidth(context),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                    color: ColorUtils.black.withOpacity(0.4),
                    // borderRadius: BorderRadius.only(
                    //   bottomRight: Radius.circular(25),
                    //   bottomLeft: Radius.circular(25),
                    // ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/metapose_logo.png'),
                          height: 100,
                        ),
                        VerticalSpace(height: 5),
                        MyText(
                          text: 'Order Summary',
                          fontSize: 40,
                          // textAlign: TextAlign.start,
                          textColor: ColorUtils.white,
                          softSwap: true,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.bold,
                        ),

                        // OrderTracker(
                        //   status: Status.order,
                        //   activeColor: Colors.green,
                        //   inActiveColor: Colors.grey[300],
                        //   // orderTitleAndDateList: orderList,
                        //   // shippedTitleAndDateList: shippedList,
                        //   // outOfDeliveryTitleAndDateList: outOfDeliveryList,
                        //   // deliveredTitleAndDateList: deliveredList,
                        // ),


                        VerticalSpace(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // List of items
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        DividerWidget(height: 12,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'Deliver to:',
                                    fontSize: 20,
                                    // textAlign: TextAlign.start,
                                    textColor: ColorUtils.black,
                                    softSwap: true,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    // height: 45,
                                    padding: EdgeInsets.only(left: 20,right: 20,top: 6,bottom: 6),
                                    decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: ColorUtils.black.withOpacity(0.6))
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: 'Change',
                                        fontSize: 14,
                                        // textAlign: TextAlign.start,
                                        textColor: ColorUtils.blue,
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              VerticalSpace(height: 10),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'Sagar Kumar',
                                    fontSize: 20,
                                    // textAlign: TextAlign.start,
                                    textColor: ColorUtils.black,
                                    softSwap: true,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  HorizontalSpace(width: 10),
                                  Container(
                                    // height: 45,
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 6,bottom: 6),
                                    decoration:  BoxDecoration(
                                      color: ColorUtils.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(2),
                                      // border: Border.all(color: ColorUtils.black.withOpacity(0.6))
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: 'HOME',
                                        fontSize: 10,
                                        // textAlign: TextAlign.start,
                                        textColor: ColorUtils.black,
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              VerticalSpace(height: 2),
                              MyText(
                                text: '1st Floor, Tower No C, Noida One, C -109, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309',
                                fontSize: 16,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black.withOpacity(0.8),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w500,
                              ),
                              VerticalSpace(height: 8),
                              MyText(
                                text: '7295992604',
                                fontSize: 16,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black.withOpacity(0.8),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w500,
                              ),
                              VerticalSpace(height: 10),
                            ],
                          ),
                        ),
                        DividerWidget(height: 12,),
                        VerticalSpace(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(image: AssetImage('assets/images/burger.jpg')),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          MyText(
                                            text: widget.dealName,
                                            fontSize: 16,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.red,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(widget.dealFoodName.length, (index) {
                                              final noOfItem = widget.dealNoOfItem[index];
                                              final food = widget.dealFoodName[index];
                                              final category = widget.dealCategory[index];
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  VerticalSpace(height: 2),
                                                  MyText(
                                                    text: "$noOfItem x $category",
                                                    fontSize: 14,
                                                    textColor: ColorUtils.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  VerticalSpace(height: 3),
                                                  MyText(
                                                    text: food,
                                                    fontSize: 14,
                                                    textColor: ColorUtils.black.withOpacity(0.85),
                                                    softSwap: true,
                                                    overflow: TextOverflow.visible,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  VerticalSpace(height: 4),

                                                ],
                                              );
                                            }),
                                          ),
                                          // VerticalSpace(height: 5),
                                          // MyText(
                                          //   text: '${widget.dealNoOfItem}x ${widget.dealCategory}',
                                          //   fontSize: 16,
                                          //   textColor: ColorUtils.black,
                                          //   fontWeight: FontWeight.w700,
                                          // ),
                                          // VerticalSpace(height: 3),
                                          // // for(var i in data.dealSelectedFoodName)
                                          //   MyText(
                                          //     text: widget.dealFoodName,
                                          //     fontSize: 14,
                                          //     textColor: ColorUtils.black.withOpacity(0.85),
                                          //     softSwap: true,
                                          //     overflow: TextOverflow.visible,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          VerticalSpace(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                MyText(
                                                  text: '77 %',
                                                  fontSize: 14,
                                                  // textAlign: TextAlign.start,
                                                  textColor: Colors.green,
                                                  softSwap: true,
                                                  overflow: TextOverflow.visible,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                HorizontalSpace(width: 10),
                                                MyText(
                                                  text: '\$2899',
                                                  fontSize: 14,
                                                  // textAlign: TextAlign.start,
                                                  textColor: ColorUtils.black.withOpacity(0.7),
                                                  softSwap: true,
                                                  overflow: TextOverflow.visible,
                                                  fontWeight: FontWeight.w400,
                                                  textDecoration: TextDecoration.lineThrough,
                                                ),
                                                HorizontalSpace(width: 10),
                                                MyText(
                                                  text: '\$ ${widget.dealPrice}',
                                                  fontSize: 14,
                                                  // textAlign: TextAlign.start,
                                                  textColor: ColorUtils.black,
                                                  softSwap: true,
                                                  overflow: TextOverflow.visible,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalSpace(height: 10),
                              MyText(
                                text: 'Delivery by jun 28,Sat',
                                fontSize: 14,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black.withOpacity(0.8),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w500,
                              ),
                              VerticalSpace(height: 10),
                              DividerWidget(height: 1,),
                              VerticalSpace(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.pinkAccent.withOpacity(0.3)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add_shopping_cart,color: ColorUtils.black,size: 20,),
                                    ),
                                  ),
                                  HorizontalSpace(width: 10),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        // text: 'Hello ', // First part
                                        // style: TextStyle(color: Colors.black, fontSize: 18),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Cancellation is allowed up to 24 hours after placing the order. ',
                                            style: GoogleFonts.vidaloka(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: ColorUtils.black,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Know more',
                                            style: GoogleFonts.vidaloka(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: ColorUtils.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              VerticalSpace(height: 10),
                            ],
                          ),
                        ),
                        DividerWidget(height: 12,),
                        VerticalSpace(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Price Details',
                                fontSize: 20,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                              ),
                              VerticalSpace(height: 10),
                              Card(
                                color: Colors.yellow.withOpacity(0.1),
                                surfaceTintColor: Colors.yellow.withOpacity(0.1),
                                margin: EdgeInsets.zero,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Price (${widget.dealQty} item)',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          MyText(
                                            text: '\$${widget.dealTotalPrice}',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      VerticalSpace(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Discount',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          MyText(
                                            text: '\$0.77',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      VerticalSpace(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Platform Fee',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          MyText(
                                            text: '\$0.00',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      VerticalSpace(height: 10),
                                      DividerWidget(height: 1.3,),
                                      VerticalSpace(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Total Amount',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          MyText(
                                            text: '\$${widget.dealTotalPrice}',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Card(
                            color: ColorUtils.white,
                            surfaceTintColor: ColorUtils.white,
                            margin: EdgeInsets.zero,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MyText(
                                    text: 'Choose Payment Method ?',
                                    fontSize: 18,
                                    textColor: ColorUtils.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DividerWidget(height: 1.3,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      setState(() {
                                        selectedPayment = 'Pay at Counter';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Pay at Counter',
                                          groupValue: selectedPayment,
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          activeColor: Colors.blue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedPayment = value!;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: MyText(
                                            text: 'Pay at Counter',
                                            fontSize: 15,
                                            textColor: ColorUtils.black.withOpacity(0.85),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      setState(() {
                                        selectedPayment = 'Online Payment';
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Online Payment',
                                          groupValue: selectedPayment,
                                          activeColor: Colors.blue,
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedPayment = value!;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: MyText(
                                            text: 'Online Payment',
                                            fontSize: 15,
                                            textColor: ColorUtils.black.withOpacity(0.85),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalSpace(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: RichText(
                            text: TextSpan(
                              // text: 'Hello ', // First part
                              // style: TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'By continuing with the order,you confirm that you are above 18 of age,and you agree to the Metapos',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Term of Use ',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorUtils.blue,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'and',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Privacy Policy',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorUtils.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalSpace(height: 100)
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
