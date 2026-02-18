import 'dart:convert';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Hold_Multiple_order_model/Category_Hold_Multiple_order_model.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Hold_Multiple_order_model/HalfAndHalf_Hold_Multiple_order_model.dart';
import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/PrefUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_ui/category_cart_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_ui/deal_cart_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_ui/half_n_half_cart_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_ui/special_deals_cart_ui.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/category_order_summary_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/halfnhalf_order_summary_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/cart_all_Items_total_price_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/submit_order_all_products.dart';
import 'cart_screen_arrowBack_button_source.dart';

class CartScreen extends StatefulWidget {
  final CartScreenArrowbackButtonSource source ;
  const CartScreen({super.key, required this.source});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final RazorpayService razorpayService = RazorpayService();
  final CategoryPriceCartController bqController = Get.put(CategoryPriceCartController());
  final internetController = Get.find<InternetController>();
  String selectedPayment = 'Pay at Counter';
  final finalController = Get.find<CartAllItemsTotalPriceController>();
  CategoryController categoryController = Get.put(CategoryController()) ;
  final HalfNHalfPriceCartController halfNHalfController = Get.put(HalfNHalfPriceCartController());

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
            toolbarHeight: 0,
            backgroundColor: ColorUtils.white,
            expandedHeight: 190.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 190,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
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
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/images/metapose_logo.png'),
                              height: 100,
                            ),
                            VerticalSpace(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5,bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: ColorUtils.white,
                                    ),
                                    height: 65,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(image:AssetImage('assets/icons/delivery.png'),height: 20,),
                                        VerticalSpace(height: 5),
                                        MyText(
                                          text: 'Delivery',
                                          fontSize: 14,
                                          // textAlign: TextAlign.start,
                                          textColor: ColorUtils.black,
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                HorizontalSpace(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5,bottom: 5),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: ColorUtils.white,

                                    ),
                                    height: 65,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(image:AssetImage('assets/icons/pickup.png'),height: 20,),
                                        VerticalSpace(height: 5),
                                        MyText(
                                          text: 'Pick-Up',
                                          fontSize: 14,
                                          // textAlign: TextAlign.start,
                                          textColor: ColorUtils.black,
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            VerticalSpace(height: 20),
                          ],
                        ),
                        if (widget.source == CartScreenArrowbackButtonSource.showIcon)
                          IconButton(
                            icon:  Icon(Icons.arrow_back_ios,color: ColorUtils.colorWhite,),
                            onPressed: () => Navigator.pop(context),
                          ),
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
                        /// Category
                        const CategoryCartUi(),
                        /// Half N Half
                        HalfNHalfCartUi(),
                        /// Deals
                        DealCartUi(),
                        ///Special Deals
                        SpecialDealsCartUi(),
                        ///Feeling Thirsty ui
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right:12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 10),
                              MyText(
                                text: 'OFFERS',
                                fontSize: 20,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                              ),
                              VerticalSpace(height: 20),
                              Card(
                                color: ColorUtils.white,
                                surfaceTintColor: ColorUtils.white,
                                margin: EdgeInsets.zero,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.red.withOpacity(0.3),
                                        Colors.red.withOpacity(0.1),
                                        Colors.white.withOpacity(0.2),
                                        Colors.white,
                                      ],
                                    ),
                                  ),

                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/logo_mono.png'),height: 30,),
                                            HorizontalSpace(width: 15),
                                            MyText(
                                              text: 'MetaPOS Pizzaria',
                                              fontSize: 14,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.red,
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            Spacer(),
                                            MyText(
                                              text: 'Apply',
                                              fontSize: 14,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.red,
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DividerWidget(height: 1.3,),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child:   MyText(
                                          text: 'View more offers',
                                          fontSize: 14,
                                          // textAlign: TextAlign.start,
                                          textColor: ColorUtils.black,
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                          textDecoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 20),
                            ],
                          ),
                        ),
                        DividerWidget(),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right:12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 10),
                              MyText(
                                text: 'Bill Details'.toUpperCase(),
                                fontSize: 20,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                              ),
                              VerticalSpace(height: 10),
                              Card(
                                color: ColorUtils.white,
                                surfaceTintColor: ColorUtils.white,
                                margin: EdgeInsets.zero,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Subtotal',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          Obx(() {
                                            return MyText(
                                              text: '\$ ${finalController.cartAllItemsTotalPrice.value.toStringAsFixed(2)}',
                                              fontSize: 14,
                                              // textAlign: TextAlign.start,
                                              textColor: ColorUtils.black,
                                              softSwap: true,
                                              overflow: TextOverflow.visible,
                                              fontWeight: FontWeight.w400,
                                            );
                                          },)
                                        ],
                                      ),
                                      VerticalSpace(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Website Surcharge',
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
                                            text: 'Grand Total',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Obx(() => MyText(
                                            text: '\$ ${finalController.cartAllItemsTotalPrice.value.toStringAsFixed(2)}',
                                            fontSize: 14,
                                            // textAlign: TextAlign.start,
                                            textColor: ColorUtils.black,
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.bold,
                                          ),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 20),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Obx(() =>  MyButton(
                              height: 50,
                              radius: 12,
                              buttonColor: Colors.red,
                              navigateTo: () {
                                Future.microtask(() async {
                                  if (internetController.isOnline.value) {
                                    var body = {
                                      "total": finalController.cartAllItemsTotalPrice.value.toStringAsFixed(2),
                                      "customer_discounted_amount": "0.0",
                                      "customer_discount_value":"0.0",
                                      "customer_discount_type":"0.0",
                                      "customer_signature_image": "",
                                      "due_amount":"0.0",
                                      "tyro_surcharge":"0.00",
                                      "couponDiscount":"0.0",
                                      "customDiscount":"0.0",
                                      "admin_commission_percentage":"0.0",
                                      "admin_commission_amount":"0.0",
                                      "survice_charge":"0.0",
                                      "survice_percent":"0.0",
                                      "platform_discount_percent":"0.0",
                                      "address": "",
                                      "phone": PrefUtils.getUserPhone(),
                                      "name": PrefUtils.getUserName(),
                                      "email": PrefUtils.getEmail(),
                                      "comments": "test comments",
                                      "pstatus": "",
                                      "lat" : "0",
                                      "lng" : "0",
                                      "curbsidePickup" : "true",
                                      "table_no":"",
                                      "send": "1",
                                      "tax": "0.0",
                                      "gst_tax_total_amount": "0.0",
                                      "giftcard_code":"",
                                      "giftcard_discount_amount":"0.00",
                                      "loyalty_discount_amount":"0.00",
                                      "hint": "",
                                      "couponName" : "",
                                      "restaurant": "23",
                                      "method": "NA",
                                      "fee": "0.0",
                                      "data":jsonEncode(SubmitOrderAllProducts.sendAllItems()),
                                      "order_date": categoryController.submitOrderDateTime(),
                                      "order_booking_slot_id":"",
                                      "order_booking_slot":"",
                                      "order_type":"POS",
                                      "sub_order_type":"Walk In",
                                      "customExtraPrice":"",
                                      "customExtraDescription":"",
                                      "discount_type":"",
                                      "table_reservations_id":"",
                                      "people_no":"",
                                      "no_of_child":"",
                                      "temp_id":"0",
                                      "status":"1",
                                      "type":"0",
                                      "managerId":"1159",
                                      "staffId":"228",
                                      "special_deal_discount":"[]"
                                    };
                                    await categoryController.submitOrder(body: body,);
                                    await transferHalfAndHalfCartToHoldMultipleOrderBox();
                                    await transferCategoryCartBoxToHoldMultipleOrderBox();
                                    SnackBarUtils.showSuccess(
                                      "Success!",
                                      "Your orders has been placed successfully!",
                                    );

                                  }else{
                                    SnackBarUtils.showWarning(
                                      "Offline Mode",
                                      "You are offline. Your order will be submitted once you're back online.",
                                    );
                                  }
                                });
                                // if(internetController.isOnline.value){
                                //     var body = {
                                //     "total": finalController.cartAllItemsTotalPrice.value.toStringAsFixed(2),
                                //     "customer_discounted_amount": "0.0",
                                //     "customer_discount_value":"0.0",
                                //     "customer_discount_type":"0.0",
                                //     "customer_signature_image": "",
                                //     "due_amount":"0.0",
                                //     "tyro_surcharge":"0.00",
                                //     "couponDiscount":"0.0",
                                //     "customDiscount":"0.0",
                                //     "admin_commission_percentage":"0.0",
                                //     "admin_commission_amount":"0.0",
                                //     "survice_charge":"0.0",
                                //     "survice_percent":"0.0",
                                //     "platform_discount_percent":"0.0",
                                //     "address": "",
                                //     "phone": PrefUtils.getUserPhone(),
                                //     "name": PrefUtils.getUserName(),
                                //     "email": PrefUtils.getEmail(),
                                //     "comments": "test comments",
                                //     "pstatus": "",
                                //     "lat" : "0",
                                //     "lng" : "0",
                                //     "curbsidePickup" : "true",
                                //     "table_no":"",
                                //     "send": "1",
                                //     "tax": "0.0",
                                //     "gst_tax_total_amount": "0.0",
                                //     "giftcard_code":"",
                                //     "giftcard_discount_amount":"0.00",
                                //     "loyalty_discount_amount":"0.00",
                                //     "hint": "",
                                //     "couponName" : "",
                                //     "restaurant": "23",
                                //     "method": "NA",
                                //     "fee": "0.0",
                                //     "data":jsonEncode(SubmitOrderAllProducts.sendAllItems()),
                                //     "order_date": categoryController.submitOrderDateTime(),
                                //     "order_booking_slot_id":"",
                                //     "order_booking_slot":"",
                                //     "order_type":"POS",
                                //     "sub_order_type":"Walk In",
                                //     "customExtraPrice":"",
                                //     "customExtraDescription":"",
                                //     "discount_type":"",
                                //     "table_reservations_id":"",
                                //     "people_no":"",
                                //     "no_of_child":"",
                                //     "temp_id":"0",
                                //     "status":"1",
                                //     "type":"0",
                                //     "managerId":"1159",
                                //     "staffId":"228",
                                //     "special_deal_discount":"[]"
                                //   };
                                //     categoryController.submitOrder(body: body,);
                                // }else{
                                //   SnackBarUtils.showWarning(
                                //     "Offline Mode",
                                //     "You are offline. Your order will be submitted once you're back online.",
                                //   );
                                // }
                              },
                              buttonName: internetController.isOnline.value ?'Submit all order':"No Internet"
                          )),
                        ),
                        VerticalSpace(height: 30)
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

  Future<void> transferHalfAndHalfCartToHoldMultipleOrderBox() async {
    final cartBox = HiveBoxes.halfAndHalfAddToCartDB();
    final holdBox = HiveBoxes.halfAndHalfHoldMultipleOrderDB();

    if (cartBox.isEmpty) return;

    for (var item in cartBox.values) {
      holdBox.add(
        HalfAndHalfHoldMultipleOrderDBModel(
          firstHalfSelectedAddons: item.firstHalfSelectedAddons,
          secondHalfSelectedAddons: item.secondHalfSelectedAddons,
          firstHalfSelect: item.firstHalfSelect,
          firstHalfSelectedName: item.firstHalfSelectedName,
          firstHalfSelectedNameId: item.firstHalfSelectedNameId,
          firstHalfSelectedVariant: item.firstHalfSelectedVariant,
          firstHalfSelectedPrice: item.firstHalfSelectedPrice,
          secondHalfSelect: item.secondHalfSelect,
          secondHalfSelectedName: item.secondHalfSelectedName,
          secondHalfSelectedNameId: item.secondHalfSelectedNameId,
          secondHalfSelectedVariant: item.secondHalfSelectedVariant,
          secondHalfSelectedPrice: item.secondHalfSelectedPrice,
          firstHalfSelectedRemoveItems: item.firstHalfSelectedRemoveItems,
          secondHalfSelectedRemoveItems: item.secondHalfSelectedRemoveItems,
          productName: item.productName,
          totalPrice: item.totalPrice,
          productId: item.productId,
          productDesc: item.productDesc,
          productCount: item.productCount,
          catId: item.catId,
          catName: item.catName,
          type: item.type,
          contains: item.contains,
          image: item.image,
          firstHalfSelectedAddonsAvailable: item.firstHalfSelectedAddonsAvailable,
          secondHalfSelectedAddonsAvailable: item.secondHalfSelectedAddonsAvailable,
        ),
      );
    }
    await cartBox.clear();
  }

  Future<void> transferCategoryCartBoxToHoldMultipleOrderBox() async {
    final cartBox = HiveBoxes.categoryAddToCartDB();
    final holdBox = HiveBoxes.categoryHoldMultipleOrderDB();

    if (cartBox.isEmpty) return;

    for (var item in cartBox.values) {
      holdBox.add(
        CategoryHoldMultipleOrderDB(
          productName: item.productName,
          productCount: item.productCount,
          catId: item.catId,
          catName: item.catName,
          type: item.type,
          contains: item.contains,
          id: item.id,
          productPrice: item.productPrice,
          productTotalPrice: item.productTotalPrice,
          desc: item.desc,
          extras: item.extras,
          gstApplicable: item.gstApplicable,
          gstTaxPercentage: item.gstTaxPercentage,
          images: item.images,
          selectedAddons: item.selectedAddons,
          variantLargeSelectedId: item.variantLargeSelectedId ,
          variantLargeSelectedName: item.variantLargeSelectedName,
          variantOptionSelectedId: item.variantLargeSelectedId,
          variantOptionSelectedName: item.variantLargeSelectedName,
          variantXLargeSelectedName: item.variantXLargeSelectedName,
          variantXLargeSelectedId: item.variantXLargeSelectedId
        ),
      );
    }
    await cartBox.clear();
  }
}




