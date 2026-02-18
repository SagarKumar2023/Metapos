import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/half_and_half_order_details_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/cart_all_Items_total_price_controller.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/submit_order_all_products.dart';
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

class DisplayAllOrdersUi extends StatefulWidget {
  const DisplayAllOrdersUi({super.key});

  @override
  State<DisplayAllOrdersUi> createState() => _DisplayAllOrdersUiState();
}

class _DisplayAllOrdersUiState extends State<DisplayAllOrdersUi> {
  // final HalfNHalfPriceCartController halfNHalfController = Get.put(HalfNHalfPriceCartController());
  // late HalfNHalfPriceCartController halfNHalfController;
  final halfNHalfList = SubmitOrderDataHolder.halfNHalfItems;
  final categoryList = SubmitOrderDataHolder.categoryItems;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // DividerWidget(),
        if(halfNHalfList.isNotEmpty || categoryList.isNotEmpty)
        MyText(
          text: 'All Orders Items',
          fontSize: 25,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.black,
          softSwap: true,
          overflow: TextOverflow.visible,
          fontWeight: FontWeight.w500,
        ),
        if(halfNHalfList.isNotEmpty || categoryList.isNotEmpty)
          CustomDividerWidget(),
        if(halfNHalfList.isNotEmpty)
          VerticalSpace(height: 10),
        if(halfNHalfList.isNotEmpty)
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: halfNHalfList.length,
          itemBuilder: (context, index) {
            final product = halfNHalfList[index];
            // final unitPrice = double.tryParse(product.totalPrice.toString()) ?? 0.0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: HalfAndHalfOrderDetailsScreen(
                      productName: product.productName,
                      qty: 1,
                      // qty: halfNHalfController.halfNHalfQuantities.length > index ? halfNHalfController.halfNHalfQuantities[index] : 1,
                      productPrice: product.totalPrice,
                      id: product.productId,
                      productTotalPrice: "0.0",
                      // productTotalPrice: total.toStringAsFixed(2),
                      grandTotalPrice: double.parse("0.0"),
                      // grandTotalPrice: double.parse(halfNHalfController.halfNHalfItemTotals[index].toStringAsFixed(2)),
                      firstHalfAddonData:product.firstHalfSelectedAddons,
                      secondHalfAddonData:product.secondHalfSelectedAddons,
                      firstHalfRemoveData:product.firstHalfSelectedRemoveItems,
                      secondHalfRemoveData:product.secondHalfSelectedRemoveItems,
                      productDesc: product.productDesc,
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right:12),
                  child: DottedBorder(
                    strokeWidth: 1.5,
                    dashPattern: [3,2],
                    radius: Radius.circular(12),
                    borderType: BorderType.RRect,
                    child: Card(
                      color: ColorUtils.white,
                      surfaceTintColor: ColorUtils.white,
                      // color: Color(0xffE6E6FA),
                      // surfaceTintColor: Color(0xffE6E6FA),
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                padding: const EdgeInsets.only(left: 10,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        // box.deleteAt(index);
                                      },
                                      child: MyText(
                                        text: product.productName,
                                        fontSize: 16,
                                        textColor: ColorUtils.black.withOpacity(0.7),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        // box.deleteAt(index);
                                      },
                                      child: MyText(
                                        text: product.productDesc,
                                        fontSize: 16,
                                        textColor: ColorUtils.black.withOpacity(0.7),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Html(
                                      data: getLimitedHtmlText(product.productDesc),
                                      shrinkWrap: true,
                                      style: {
                                        "body": Style(
                                          fontSize: FontSize(14.0),
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w300,
                                          margin: Margins.zero,
                                          padding: HtmlPaddings.zero,
                                        ),
                                        "p": Style.fromTextStyle(
                                          GoogleFonts.vidaloka(
                                            textStyle: TextStyle(
                                              fontSize: 14.0,
                                              color: ColorUtils.black.withOpacity(0.7),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ).copyWith(
                                          textAlign: TextAlign.start,
                                          margin: Margins.zero,
                                        ),
                                        "strong": Style(fontWeight: FontWeight.w300),
                                        "em": Style(),
                                      },
                                    ),
                                    VerticalSpace(height: 5),
                                    RatingBar.builder(
                                      itemSize: 18,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(horizontal:0.1),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    VerticalSpace(height: 5),
                                    MyText(
                                      text: 'Rate this product now',
                                      fontSize: 14,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.blue.withOpacity(0.7),
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
            // return Obx(() {
            //   if (index >= halfNHalfController.halfNHalfQuantities.length) return SizedBox();
            //   final qty = halfNHalfController.halfNHalfQuantities[index];
            //   final total = qty * unitPrice;
            //   return ;
            // },);
          },
        ),
        if(categoryList.isNotEmpty)
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final product = categoryList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: InkWell(
                onTap: () {
                  // PersistentNavBarNavigator.pushNewScreen(
                  //   context,
                  //   screen: CategoryOrderDetailsScreen(
                  //     productName: product.productName,
                  //     qty:product.qty,
                  //     productPrice: product.productPrice,
                  //     productTotalPrice: product.productTotalPrice,
                  //     id: product.productId,
                  //     variantOption: product.variantOption,
                  //     productDesc: product.productDesc,
                  //     grandTotalPrice: product.grandTotalPrice,
                  //   ),
                  //   withNavBar: false,
                  //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 12,right:12),
                  child: DottedBorder(
                    strokeWidth: 1.5,
                    dashPattern: [3,2],
                    radius: Radius.circular(12),
                    borderType: BorderType.RRect,
                    child: Card(
                      color: ColorUtils.white,
                      surfaceTintColor: ColorUtils.white,
                      // color: Color(0xffE6E6FA),
                      // surfaceTintColor: Color(0xffE6E6FA),
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                                padding: const EdgeInsets.only(left: 10,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        // box.deleteAt(index);
                                      },
                                      child: MyText(
                                        text: product.productName,
                                        fontSize: 16,
                                        textColor: ColorUtils.black.withOpacity(0.7),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Html(
                                      data: getLimitedHtmlText(product.desc),
                                      shrinkWrap: true,
                                      style: {
                                        "body": Style(
                                          fontSize: FontSize(14.0),
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w300,
                                          margin: Margins.zero,
                                          padding: HtmlPaddings.zero,
                                        ),
                                        "p": Style.fromTextStyle(
                                          GoogleFonts.vidaloka(
                                            textStyle: TextStyle(
                                              fontSize: 14.0,
                                              color: ColorUtils.black.withOpacity(0.7),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ).copyWith(
                                          textAlign: TextAlign.start,
                                          margin: Margins.zero,
                                        ),
                                        "strong": Style(fontWeight: FontWeight.w300),
                                        "em": Style(),
                                      },
                                    ),
                                    VerticalSpace(height: 5),
                                    RatingBar.builder(
                                      itemSize: 18,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(horizontal:0.1),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    VerticalSpace(height: 5),
                                    MyText(
                                      text: 'Rate this product now',
                                      fontSize: 14,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.blue.withOpacity(0.7),
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // CustomDividerWidget(),
        if(categoryList.isNotEmpty)
         VerticalSpace(height: 15),
        if(halfNHalfList.isNotEmpty || categoryList.isNotEmpty)
          DividerWidget(),

      ],
    );
  }

  String getLimitedHtmlText(String htmlString, {int wordLimit = 5}) {
    final words = htmlString.split(RegExp(r'\s+')); // Split by space
    if (words.length <= wordLimit) return htmlString;
    final limited = words.take(wordLimit).join(" ");
    return "$limited...";
  }

}
