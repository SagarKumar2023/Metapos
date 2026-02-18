import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Order/CategoryOrderHiveBoxModel.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/PrefUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/google_map_integration/user_current_address.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/deals_order_summary_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/submit_order_all_products.dart';
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

class CategoryOrderSummaryDetailsScreen extends StatefulWidget {
  final String productName ;
  final int qty ;
  final String productPrice ;
  final int id ;
  final String variantOption ;
  final String productTotalPrice ;
  final String productDesc ;
  final double grandTotalPrice ;
  final int addSingleCategoryItemByIndex ;
  const CategoryOrderSummaryDetailsScreen({super.key, required this.productName, required this.qty, required this.productPrice, required this.id, required this.variantOption, required this.productTotalPrice, required this.productDesc, required this.grandTotalPrice, required this.addSingleCategoryItemByIndex,});

  @override
  State<CategoryOrderSummaryDetailsScreen> createState() => _CategoryOrderSummaryDetailsScreenState();
}

class _CategoryOrderSummaryDetailsScreenState extends State<CategoryOrderSummaryDetailsScreen> {


  final RazorpayService razorpayService = RazorpayService();

  List<int> quantities = [];

  String selectedPayment = 'Pay at Counter';

  CategoryController categoryController = Get.put(CategoryController());
  final internetController = Get.find<InternetController>();

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
          child:selectedPayment == 'Online Payment'?MyButton(
              height: 50,
              radius: 12,
              buttonColor: Colors.red,
              navigateTo: () {
                razorpayService.openCheckout(
                    orderId: widget.id.toString(),
                    name: PrefUtils.getUserName(),
                    contact: PrefUtils.getUserPhone(),
                    email: PrefUtils.getEmail(),
                    amount: widget.grandTotalPrice,
                    desc: 'Metapos',
                );
              },
              buttonName: 'Pay Securely \$ ${widget.grandTotalPrice}'
          ):MyButton(
              radius: 12,
              height: 50,
              buttonColor: Colors.red,
              // navigateTo: (){
              //   if(internetController.isOnline.value){
              //     final box = HiveBoxes.categoryAddToCartHiveBox();
              //     final selectedItem = box.getAt(widget.addSingleCategoryItemByIndex);
              //
              //     if (selectedItem == null) {
              //       SnackBarUtils.showWarning("Error", "Item not found!");
              //       return;
              //     }
              //
              //     final singleItemData = SubmitOrderAllProducts.orderSingleCategoryItem(selectedItem);
              //     var body = {
              //       "total": widget.productTotalPrice,
              //       "customer_discounted_amount": "0.0",
              //       "customer_discount_value": "0.0",
              //       "customer_discount_type": "0.0",
              //       "customer_signature_image": "",
              //       "due_amount": "0.0",
              //       "tyro_surcharge": "0.00",
              //       "couponDiscount": "0.0",
              //       "customDiscount": "0.0",
              //       "admin_commission_percentage": "0.0",
              //       "admin_commission_amount": "0.0",
              //       "survice_charge": "0.0",
              //       "survice_percent": "0.0",
              //       "platform_discount_percent": "0.0",
              //       "address": "Greater Noida W Rd, Gaur City 1, Sector 4, Greater Noida, Ghaziabad, Uttar Pradesh 201318",
              //       "phone": PrefUtils.getUserPhone(),
              //       "name": PrefUtils.getUserName(),
              //       "email": PrefUtils.getEmail(),
              //       "comments": "test comments",
              //       "pstatus": "",
              //       "lat": "0",
              //       "lng": "0",
              //       "curbsidePickup": "true",
              //       "table_no": "",
              //       "send": "1",
              //       "tax": "0.0",
              //       "gst_tax_total_amount": "0.0",
              //       "giftcard_code": "",
              //       "giftcard_discount_amount": "0.00",
              //       "loyalty_discount_amount": "0.00",
              //       "hint": "",
              //       "couponName": "",
              //       "restaurant": "23",
              //       "method": "NA",
              //       "fee": "0.0",
              //       "data": jsonEncode([singleItemData]),
              //       "order_date": categoryController.submitOrderDateTime(),
              //       "order_booking_slot_id": "",
              //       "order_booking_slot": "",
              //       "order_type": "POS",
              //       "sub_order_type": "Walk In",
              //       "customExtraPrice": "",
              //       "customExtraDescription": "",
              //       "discount_type": "",
              //       "table_reservations_id": "",
              //       "people_no": "",
              //       "no_of_child": "",
              //       "temp_id": "0",
              //       "status": "1",
              //       "type": "0",
              //       "managerId": "1159",
              //       "staffId": "228",
              //       "special_deal_discount": "[]"
              //     };
              //     categoryController.submitOrder(body: body);
              //     final orderBox = HiveBoxes.categorySingleOrderListBox();
              //     // final productBox = HiveBoxes.categoryAddToCartHiveBox();
              //
              //     final model = CategoryOrderHiveBoxModel(
              //       productId: widget.id,
              //       productName: widget.productName,
              //       productPrice: widget.productPrice,
              //       productTotalPrice: widget.productTotalPrice,
              //       qty: widget.qty,
              //       productDesc: widget.productDesc,
              //       variantOption: widget.variantOption,
              //       grandTotalPrice: widget.grandTotalPrice,
              //     );
              //     orderBox.add(model);
              //     final keyToDelete = box.keys.firstWhere(
              //           (key) => box.get(key)?.id == widget.id,
              //       orElse: () => null,
              //     );
              //
              //     if (keyToDelete != null) {
              //       box.delete(keyToDelete);
              //       Navigator.pop(context);
              //       SnackBarUtils.showSuccess(
              //         "Success!",
              //         "Your order has been placed successfully!",
              //       );
              //     }
              //     // box.deleteAt(widget.addSingleCategoryItemByIndex);
              //     // Navigator.pop(context);
              //   }else{
              //     SnackBarUtils.showWarning(
              //       "Offline Mode",
              //       "You are offline. Your order will be submitted once you're back online.",
              //     );
              //   }
              //
              // },
              ///
              navigateTo: (){
                Future.microtask(() async {

                  if(internetController.isOnline.value){
                    final categoryCartBox = HiveBoxes.categoryAddToCartDB();
                    final selectedItem = categoryCartBox.getAt(widget.addSingleCategoryItemByIndex);

                    if (selectedItem == null) {
                      SnackBarUtils.showWarning("Error", "Item not found!");
                      return;
                    }
                    final singleItemData = SubmitOrderAllProducts.orderSingleCategoryItem(selectedItem);
                    var body = {
                      "total": widget.productTotalPrice,
                      "customer_discounted_amount": "0.0",
                      "customer_discount_value": "0.0",
                      "customer_discount_type": "0.0",
                      "customer_signature_image": "",
                      "due_amount": "0.0",
                      "tyro_surcharge": "0.00",
                      "couponDiscount": "0.0",
                      "customDiscount": "0.0",
                      "admin_commission_percentage": "0.0",
                      "admin_commission_amount": "0.0",
                      "survice_charge": "0.0",
                      "survice_percent": "0.0",
                      "platform_discount_percent": "0.0",
                      "address": "Greater Noida W Rd, Gaur City 1, Sector 4, Greater Noida, Ghaziabad, Uttar Pradesh 201318",
                      "phone": PrefUtils.getUserPhone(),
                      "name": PrefUtils.getUserName(),
                      "email": PrefUtils.getEmail(),
                      "comments": "test comments",
                      "pstatus": "",
                      "lat": "0",
                      "lng": "0",
                      "curbsidePickup": "true",
                      "table_no": "",
                      "send": "1",
                      "tax": "0.0",
                      "gst_tax_total_amount": "0.0",
                      "giftcard_code": "",
                      "giftcard_discount_amount": "0.00",
                      "loyalty_discount_amount": "0.00",
                      "hint": "",
                      "couponName": "",
                      "restaurant": "23",
                      "method": "NA",
                      "fee": "0.0",
                      "data": jsonEncode([singleItemData]),
                      "order_date": categoryController.submitOrderDateTime(),
                      "order_booking_slot_id": "",
                      "order_booking_slot": "",
                      "order_type": "POS",
                      "sub_order_type": "Walk In",
                      "customExtraPrice": "",
                      "customExtraDescription": "",
                      "discount_type": "",
                      "table_reservations_id": "",
                      "people_no": "",
                      "no_of_child": "",
                      "temp_id": "0",
                      "status": "1",
                      "type": "0",
                      "managerId": "1159",
                      "staffId": "228",
                      "special_deal_discount": "[]"
                    };
                    await categoryController.submitOrder(body: body);
                    final categorySingleOrderBox = HiveBoxes.categoryHoldSingleOrderListDB();
                    categorySingleOrderBox.add(CategoryHoldSingleOrderModel(
                      productId: widget.id,
                      productName: widget.productName,
                      productPrice: widget.productPrice,
                      productTotalPrice: widget.productTotalPrice,
                      qty: widget.qty,
                      productDesc: widget.productDesc,
                      variantOption: widget.variantOption,
                      grandTotalPrice: widget.grandTotalPrice,
                    ));
                    categoryCartBox.deleteAt(widget.addSingleCategoryItemByIndex);
                    // if (context.mounted) Navigator.pop(context);
                    Navigator.pop(context);
                    SnackBarUtils.showSuccess(
                      "Success!",
                      "Your order has been placed successfully!",
                    );
                  }else{
                    SnackBarUtils.showWarning(
                      "Offline Mode",
                      "You are offline. Your order will be submitted once you're back online.",
                    );
                  }
                });
              },
              buttonName: internetController.isOnline.value ?'Order \$ ${widget.grandTotalPrice}':"No Internet"
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     if(selectedPayment == 'Online Payment')
          //       MyButton(
          //           height: 50,
          //           radius: 12,
          //           buttonColor: Colors.red,
          //           navigateTo: () {
          //
          //             razorpayService.openCheckout(
          //               name: "Sagar kumar",
          //               contact: "7295992604",
          //               email: "metapos.in",
          //               amount: widget.grandTotalPrice,
          //               desc: 'Metapos',
          //               orderId: widget.id.toString()
          //             );
          //
          //           },
          //           buttonName: 'Pay Securely \$ ${widget.grandTotalPrice}'
          //       )
          //     else if (selectedPayment == 'Pay at Counter')
          //       MyButton(
          //           radius: 12,
          //           height: 50,
          //           buttonColor: Colors.red,
          //           navigateTo: (){
          //             final orderBox = HiveBoxes.categoryOrderHiveBox();
          //             final productBox = HiveBoxes.categoryAddToCartHiveBox();
          //
          //             final model = CategoryOrderHiveBoxModel(
          //               productId: widget.id,
          //               productName: widget.productName,
          //               productPrice: widget.productPrice,
          //               productTotalPrice: widget.productTotalPrice,
          //               qty: widget.qty,
          //               productDesc: widget.productDesc,
          //               variantOption: widget.variantOption,
          //               grandTotalPrice: widget.grandTotalPrice,
          //             );
          //             orderBox.add(model);
          //             final keyToDelete = productBox.keys.firstWhere(
          //                   (key) => productBox.get(key)?.id == widget.id,
          //               orElse: () => null,
          //             );
          //
          //             if (keyToDelete != null) {
          //               productBox.delete(keyToDelete);
          //             }
          //
          //             Navigator.pop(context);
          //             MySnackbar.showSuccess(
          //               context: context,
          //               message: "Your order has been confirmed.",
          //             );
          //           },
          //           buttonName: 'Continue \$ ${widget.grandTotalPrice}'
          //       )
          //   ],
          // )
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
      //               text: '\$ ${widget.grandTotalPrice}',
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
      //           height: 45,
      //           width: 200,
      //           radius: 5,
      //           buttonColor: Colors.red,
      //           navigateTo: () {
      //             final orderBox = HiveBoxes.categoryOrderHiveBox();
      //             final productBox = HiveBoxes.categoryAddToCartHiveBox();
      //
      //             final model = CategoryOrderHiveBoxModel(
      //               productId: widget.id,
      //               productName: widget.productName,
      //               productPrice: widget.productPrice,
      //               productTotalPrice: widget.productTotalPrice,
      //               qty: widget.qty,
      //               productDesc: widget.productDesc,
      //               variantOption: widget.variantOption,
      //               grandTotalPrice: widget.grandTotalPrice,
      //             );
      //             orderBox.add(model);
      //             final keyToDelete = productBox.keys.firstWhere(
      //                   (key) => productBox.get(key)?.id == widget.id,
      //               orElse: () => null,
      //             );
      //
      //             if (keyToDelete != null) {
      //               productBox.delete(keyToDelete);
      //             }
      //
      //             Navigator.pop(context);
      //             MySnackbar.showSuccess(
      //               context: context,
      //               message: "Your order has been confirmed.",
      //             );
      //           }, buttonName: 'Coninue',
      //         )
      //
      //         // ValueListenableBuilder(
      //         //     valueListenable: cartController.totalPriceNotifier,
      //         //     builder: (context, total, _){
      //         //       return MyButton(
      //         //         height: 45,width: 200,
      //         //           radius: 5,
      //         //           buttonColor: Colors.red,
      //         //           navigateTo: (){
      //         //             razorpayService.openCheckout(
      //         //                 name: "Sagar kumar",
      //         //                 contact: "7295992604",
      //         //                 email: "info@papayacoders.in",
      //         //                 amount: 299.00,
      //         //                 desc: 'Android Course'
      //         //             );
      //         //           },
      //         //           buttonName: 'Continue');
      //         //     }
      //         // ),
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
                                  InkWell(
                                    borderRadius: BorderRadius.circular(7),
                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen:UserCurrentAddress(),
                                        withNavBar: false,
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: Container(
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
                                      // padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: MyText(
                                              text: widget.productName,
                                              fontSize: 16,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.red,
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Html(
                                            data:widget.productDesc,
                                            shrinkWrap: true,
                                            style: {
                                              "body": Style(
                                                fontSize: FontSize(14.0),
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              "p": Style.fromTextStyle(
                                                GoogleFonts.vidaloka(
                                                  textStyle: TextStyle(
                                                    fontSize: 14.0,
                                                    color: ColorUtils.black,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ).copyWith(textAlign: TextAlign.start),
                                              "strong": Style(
                                                fontWeight: FontWeight.w300,
                                              ),
                                              "em": Style(
                                                // fontStyle: FontStyle.w,
                                              ),
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 18,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal:0.1),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.green,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                HorizontalSpace(width: 2),
                                                MyText(
                                                  text: '3.8',
                                                  fontSize: 14,
                                                  // textAlign: TextAlign.start,
                                                  textColor: Colors.green,
                                                  softSwap: true,
                                                  overflow: TextOverflow.visible,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                HorizontalSpace(width: 10),
                                                MyText(
                                                  text: '${widget.variantOption}',
                                                  fontSize: 14,
                                                  // textAlign: TextAlign.start,
                                                  textColor: ColorUtils.black.withOpacity(0.7),
                                                  softSwap: true,
                                                  overflow: TextOverflow.visible,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
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
