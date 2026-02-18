import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/cart_all_Items_total_price_controller.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'deal_order_details_screen.dart';
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

class DealsOrderUi extends StatefulWidget {
  const DealsOrderUi({super.key});

  @override
  State<DealsOrderUi> createState() => _DealsOrderUiState();
}

class _DealsOrderUiState extends State<DealsOrderUi> {
  final finalController = Get.find<CartAllItemsTotalPriceController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.dealsHoldSingleOrderListDB().listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();
        if (items.isEmpty) return Container();
        return Column(
          children: [
            // DividerWidget(),
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
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: DealOrderDetailsScreen(
                            dealName: product.dealName,
                            dealPrice: product.dealPrice.toString(),
                            dealTotalPrice: product.dealTotalPrice,
                            dealFoodName: product.dealFoodName,
                            dealCategory: product.dealCategory,
                            dealQty: product.dealQty,
                            dealNoOfItem: product.dealNoOfItem,
                            dealId: product.dealId,
                            dealDesc: product.dealDesc.toString()
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
                                            text: product.dealName,
                                            fontSize: 16,
                                            textColor: ColorUtils.black.withOpacity(0.7),
                                            softSwap: true,
                                            overflow: TextOverflow.visible,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        MyText(
                                          text: product.dealDesc,
                                          fontSize: 16,
                                          textColor: ColorUtils.black.withOpacity(0.7),
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
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
            VerticalSpace(height: 10),
            CustomDividerWidget(),
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
