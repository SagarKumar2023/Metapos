import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatScreen/ChatUserListScreen.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/SafeOrderTracker_widget.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_see_all_update.dart';
import 'package:order_tracker/order_tracker.dart';
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

class HalfAndHalfOrderDetailsScreen extends StatefulWidget {
  final String productName ;
  final int qty ;
  final String productPrice ;
  final String id ;
  final String productTotalPrice ;
  final double grandTotalPrice ;
  final List<CatAddonsDataArray> firstHalfAddonData;
  final List<CatAddonsDataArray> secondHalfAddonData;
  final List<String> firstHalfRemoveData;
  final List<String> secondHalfRemoveData;
  final String productDesc ;
  const HalfAndHalfOrderDetailsScreen({super.key, required this.productName, required this.qty, required this.productPrice, required this.id, required this.productTotalPrice, required this.grandTotalPrice, required this.firstHalfAddonData, required this.secondHalfAddonData, required this.firstHalfRemoveData, required this.secondHalfRemoveData, required this.productDesc, });

  @override
  State<HalfAndHalfOrderDetailsScreen> createState() => _HalfAndHalfOrderDetailsScreenState();
}

class _HalfAndHalfOrderDetailsScreenState extends State<HalfAndHalfOrderDetailsScreen>{


  final RazorpayService razorpayService = RazorpayService();

  List<int> quantities = [];

  String selectedPayment = 'Pay at Counter';

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
            title: MyText(
              text: 'Order details',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 15),
                              MyText(
                                text: 'Order Id : ${widget.id}',
                                fontSize: 14,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace(height: 10),
                        DividerWidget(height: 2,),
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
                                    flex: 3,
                                    child: Container(
                                      // padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          MyText(
                                            text: widget.productName,
                                            fontSize: 20,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black.withOpacity(0.7),
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          MyText(
                                            text: widget.productDesc,
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black.withOpacity(0.7),
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          MyText(
                                            text: 'First Half',
                                            fontSize: 18,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: "Addons:",
                                                fontSize: 13,
                                                textColor: Colors.green,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              HorizontalSpace(width: 5),
                                              Expanded(
                                                child: Wrap(
                                                  spacing: 2,
                                                  runSpacing: 2,
                                                  children: [
                                                    for (var item in widget.firstHalfAddonData)
                                                      MyText(
                                                        text: "${item.addonsName},",
                                                        fontSize: 13,
                                                        textColor: Colors.green,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: "Remove:",
                                                fontSize: 13,
                                                textColor: ColorUtils.redAccent,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              HorizontalSpace(width: 5),
                                              Expanded(
                                                child: Wrap(
                                                  spacing: 2,
                                                  runSpacing: 2,
                                                  children: [
                                                    for (var item in widget.firstHalfRemoveData)
                                                      MyText(
                                                        text: "$item,",
                                                        fontSize: 13,
                                                        textColor: ColorUtils.redAccent,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          VerticalSpace(height: 5),
                                          MyText(
                                            text: 'Second Half',
                                            fontSize: 18,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: "Addon:",
                                                fontSize: 13,
                                                textColor: Colors.green,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              HorizontalSpace(width: 5),
                                              Expanded(
                                                child: Wrap(
                                                  spacing: 2,
                                                  runSpacing: 2,
                                                  children: [
                                                    for (var item in widget.secondHalfAddonData)
                                                      MyText(
                                                        text: "${item.addonsName},",
                                                        fontSize: 13,
                                                        textColor: Colors.green,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: "Remove:",
                                                fontSize: 13,
                                                textColor: ColorUtils.redAccent,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              HorizontalSpace(width: 5),
                                              Expanded(
                                                child: Wrap(
                                                  spacing: 2,
                                                  runSpacing: 2,
                                                  children: [
                                                    for (var item in widget.secondHalfRemoveData)
                                                      MyText(
                                                        text: "$item,",
                                                        fontSize: 13,
                                                        textColor: ColorUtils.redAccent,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          VerticalSpace(height: 10),
                                          MyText(
                                            text: '\$ ${widget.productPrice}',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(image: AssetImage('assets/images/burger.jpg')),
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
                              VerticalSpace(height: 20),
                              SafeOrderTracker(
                                status: Status.order,
                                activeColor: Colors.green,
                                inActiveColor: Colors.grey[300],
                                headingDateTextStyle: GoogleFonts.vidaloka(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorUtils.black.withOpacity(0.7),
                                  ),
                                ),
                                headingTitleStyle: GoogleFonts.vidaloka(
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
                                orderList: orderList,
                                shippedList: shippedList,
                                outOfDeliveryList: outOfDeliveryList,
                                deliveredList: deliveredList,
                              ),
                              VerticalSpace(height: 20),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: MyOrderSeeAllUpdate(),
                                        withNavBar: false,
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: MyText(
                                      text: 'See All Updates',
                                      fontSize: 14,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.blue.withOpacity(0.8),
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  HorizontalSpace(width: 5),
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: ColorUtils.blue,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalSpace(height: 10),
                              MyText(
                                text: 'Return Policy ended on July 14',
                                fontSize: 15,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black.withOpacity(0.7),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w500,
                              ),
                              VerticalSpace(height: 10),
                              DividerWidget(height: 1,),
                              VerticalSpace(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: (){

                                      },
                                      child: Image(image: AssetImage('assets/icons/chat_icon.png'),height: 25,)
                                  ),
                                  HorizontalSpace(width: 5),
                                  GestureDetector(
                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: ChattingUserListScreen(),
                                        withNavBar: false,
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: MyText(
                                      text: 'Chat with us',
                                      fontSize: 18,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.black.withOpacity(0.8),
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              // VerticalSpace(height: 15),
                            ],
                          ),
                        ),
                        DividerWidget(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(left: 12,right: 12),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 15),
                              MyText(
                                text: 'Delivery details',
                                fontSize: 18,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w600,
                              ),
                              VerticalSpace(height: 10),
                              Card(
                                color: Color(0xffE6E6FA),
                                surfaceTintColor: Color(0xffE6E6FA),
                                margin: EdgeInsets.zero,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.home,
                                              color: ColorUtils.black,
                                              size: 18,
                                            ),
                                          ),
                                          HorizontalSpace(width: 3),
                                          MyText(
                                            text: 'Home  ',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black.withOpacity(0.8),
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Expanded(
                                            child: MyText(
                                              text: '1st Floor, Tower No C, Noida One, C -109, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309',
                                              fontSize: 14,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.black.withOpacity(0.8),
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      VerticalSpace(height:5),
                                      DividerWidget(height: 1.5,),
                                      VerticalSpace(height: 5),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.person,
                                              color: ColorUtils.black,
                                              size: 18,
                                            ),
                                          ),
                                          HorizontalSpace(width: 3),
                                          MyText(
                                            text: 'Sagar kumar  ',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black.withOpacity(0.8),
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Expanded(
                                            child: MyText(
                                              text:'7295992604',
                                              fontSize: 14,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.black.withOpacity(0.8),
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 15),
                            ],
                          ),
                        ),

                        DividerWidget(height: 10,),
                        VerticalSpace(height: 20),

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
                                            text: 'Price (${widget.qty} item)',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          MyText(
                                            text: '\$${widget.grandTotalPrice}',
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
                                            text: '\$${widget.grandTotalPrice}',
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
                          child: RichText(
                            text: TextSpan(
                              // text: 'Hello ', // First part
                              // style: TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(

                                  text: '•  ',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Cash On Delivery: \$ ${widget.productTotalPrice}',
                                  style: GoogleFonts.vidaloka(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.black,
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
