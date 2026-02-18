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

class HalfAndHalfHoldMultipleOrderUi extends StatefulWidget {
  const HalfAndHalfHoldMultipleOrderUi({super.key});

  @override
  State<HalfAndHalfHoldMultipleOrderUi> createState() => _HalfAndHalfHoldMultipleOrderUiState();
}

class _HalfAndHalfHoldMultipleOrderUiState extends State<HalfAndHalfHoldMultipleOrderUi> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.halfAndHalfHoldMultipleOrderDB().listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();
        if (items.isEmpty) return Container();
        return Column(
          children: [
            MyText(
              text: 'Half And Half (mo)',
              fontSize: 25,
              textColor: ColorUtils.black,
              softSwap: true,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w500,
            ),
            CustomDividerWidget(),
            VerticalSpace(height: 10),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      final int qty = int.tryParse("${product.productCount}") ?? 1;
                      final double unitPrice = double.tryParse("${product.totalPrice}") ?? 0.0;
                      final double grandTotal = double.parse((qty * unitPrice).toStringAsFixed(2));
                      PersistentNavBarNavigator.pushNewScreen(
                        context, screen: HalfAndHalfOrderDetailsScreen(
                          productName: product.productName,
                          qty: qty,
                          productPrice: product.totalPrice,
                          id: product.productId,
                          productTotalPrice: product.totalPrice,
                          grandTotalPrice: grandTotal,
                          //grandTotalPrice: double.tryParse(product.gtpOfQtyInToProductPrice?.toString() ?? "0") ?? 0.0,
                          firstHalfAddonData: product.firstHalfSelectedAddons,
                          secondHalfAddonData: product.secondHalfSelectedAddons,
                          firstHalfRemoveData: product.firstHalfSelectedRemoveItems,
                          secondHalfRemoveData: product.secondHalfSelectedRemoveItems,
                          productDesc: product.productDesc,
                        ),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: DottedBorder(
                        strokeWidth: 1.5,
                        dashPattern: [3, 2],
                        radius: Radius.circular(12),
                        borderType: BorderType.RRect,
                        child: Card(
                          color: ColorUtils.white,
                          surfaceTintColor: ColorUtils.white,
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: AssetImage('assets/images/burger.jpg'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: product.productName,
                                          fontSize: 16,
                                          textColor: ColorUtils.black.withOpacity(0.7),
                                          softSwap: true,
                                          fontWeight: FontWeight.w700,
                                        ),

                                        MyText(
                                          text: product.productDesc,
                                          fontSize: 16,
                                          textColor: ColorUtils.black.withOpacity(0.7),
                                          softSwap: true,
                                          fontWeight: FontWeight.w700,
                                        ),

                                        VerticalSpace(height: 5),
                                        RatingBar.builder(
                                          itemSize: 18,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.green,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),

                                        VerticalSpace(height: 5),
                                        MyText(
                                          text: 'Rate this product now',
                                          fontSize: 14,
                                          textColor: ColorUtils.blue.withOpacity(0.7),
                                          softSwap: true,
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

            VerticalSpace(height: 15),
            DividerWidget(),
          ],
        );
      },
    );
  }

  String getLimitedHtmlText(String htmlString, {int wordLimit = 5}) {
    final words = htmlString.split(RegExp(r'\s+')); // Split by space
    if (words.length <= wordLimit) return htmlString;
    final limited = words.take(wordLimit).join(" ");
    return "$limited...";
  }

}
