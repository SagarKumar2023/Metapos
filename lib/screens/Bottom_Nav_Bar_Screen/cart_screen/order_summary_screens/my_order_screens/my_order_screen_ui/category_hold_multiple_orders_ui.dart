import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/my_order_screens/my_order_screen_ui/category_order_details_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/cart_all_Items_total_price_controller.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:hive_flutter/adapters.dart';
export 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
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

class CategoryHoldMultipleOrdersUi extends StatefulWidget {
  const CategoryHoldMultipleOrdersUi({super.key});

  @override
  State<CategoryHoldMultipleOrdersUi> createState() => _CategorySingleOrderListUiState();
}

class _CategorySingleOrderListUiState extends State<CategoryHoldMultipleOrdersUi> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.categoryHoldMultipleOrderDB().listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();
        if (items.isEmpty) return Container();
        return Column(
          children: [
            // DividerWidget(),
            MyText(
              text: 'Category (mo)',
              fontSize: 25,
              // textAlign: TextAlign.start,
              textColor: ColorUtils.black,
              softSwap: true,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w500,
            ),
            CustomDividerWidget(),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: InkWell(
                    onTap: () {
                      final int qty = int.tryParse("${product.productCount}") ?? 1;
                      final double unitPrice = double.tryParse("${product.productPrice}") ?? 0.0;
                      final double grandTotal = double.parse((qty * unitPrice).toStringAsFixed(2));
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: CategoryOrderDetailsScreen(
                          productName: product.productName,
                          qty:qty,
                          productPrice: product.productPrice,
                          productTotalPrice: grandTotal.toString(),
                          id: product.id,
                          variantOption: product.variantOptionSelectedName.toString(),
                          productDesc: product.desc,
                          grandTotalPrice: grandTotal,
                        ),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
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
            VerticalSpace(height: 15),
            DividerWidget(),
            // CustomDividerWidget(),
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
