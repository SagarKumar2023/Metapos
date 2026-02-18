import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/CATEGORIES_AND_FOOD_LIST_DESIGN/categoriesFoodListViewTwo.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'CategoriesFoodListView.dart';

class CategoriesFoodListDesign extends StatefulWidget {
  final CategoryController categoryController ;
  const CategoriesFoodListDesign({super.key, required this.categoryController});

  @override
  State<CategoriesFoodListDesign> createState() => _CategoriesFoodListDesignState();
}

class _CategoriesFoodListDesignState extends State<CategoriesFoodListDesign> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: categoryController,
      builder: (catCtr) {
        return  ListView.builder(
          itemCount: catCtr.otherDataList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, otherDataListIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (catCtr.otherDataList[otherDataListIndex].foodList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
                  child: MyText(
                    text: catCtr.otherDataList[otherDataListIndex].name,
                    fontSize: 25,
                    textColor: ColorUtils.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (catCtr.otherDataList[otherDataListIndex].foodList.isNotEmpty)
                CustomDividerWidget(),
                ListView.builder(
                  itemCount: catCtr.otherDataList[otherDataListIndex].foodList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, foodListIndex) {
                    // CatFoodListWithDetails? foodListDetails = catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].foodListWithDetails ;
                    CatOtherDataFoodListWithDetails? foodListDetails = catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].foodListWithDetails ;

                    return InkWell(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          /// pass food_list_with_details
                          screen: CategoriesFoodListviewTwo(
                              catFoodListWithDetails : foodListDetails!,
                              images : catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].images.toString(),
                              extras : catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].extras.toString(),
                              contains : catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].contains.toString(),
                          ),
                          /// get data through the Product ID
                          // screen: CategoriesFoodListview(
                          //   id :  catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].id.toString()
                          // ),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          strokeWidth: 1.5,
                          dashPattern: [3,2],
                          radius: Radius.circular(12),
                          child: Container(
                            // padding: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(left: 12,top: 10,bottom: 10,right: 15),
                            decoration: BoxDecoration(
                              color: ColorUtils.white,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            width: screenWidth(context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].name,
                                        fontSize: 18,
                                        textColor: ColorUtils.black.withOpacity(0.85),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      MyText(
                                        text: '\$${catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].price}',
                                        fontSize: 16,
                                        textColor: ColorUtils.black.withOpacity(0.85),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Html(
                                        data: catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].desc,
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
                                                color: ColorUtils.black.withOpacity(0.9),
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
                                      // Html(
                                      //   data: catCtr.otherDataList[otherDataListIndex].foodList[foodListIndex].desc,
                                      //   shrinkWrap: true,
                                      //   style: {
                                      //     "body": Style(
                                      //       fontSize: FontSize(14.0),
                                      //       color: Colors.black87,
                                      //       fontWeight: FontWeight.w400,
                                      //       padding: HtmlPaddings.zero,
                                      //       margin: Margins.zero
                                      //     ),
                                      //     "p": Style.fromTextStyle(
                                      //
                                      //       GoogleFonts.vidaloka(
                                      //         textStyle: TextStyle(
                                      //           fontSize: 14.0,
                                      //           color: ColorUtils.black,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ).copyWith(textAlign: TextAlign.start),
                                      //     "strong": Style(
                                      //       padding: HtmlPaddings.zero,
                                      //       margin: Margins.zero,
                                      //       fontWeight: FontWeight.w700,
                                      //     ),
                                      //     "em": Style(
                                      //       padding: HtmlPaddings.zero,
                                      //       margin: Margins.zero,
                                      //       fontStyle: FontStyle.italic,
                                      //     ),
                                      //   },
                                      // ),
                                      VerticalSpace(height: 10),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: AssetImage('assets/images/chicken.jpg'),height: 100,)
                                          ),
                                          VerticalSpace(height: 10),
                                          Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: ColorUtils.black,width: 1.5)
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                MyText(
                                                  text: 'Add',
                                                  fontSize: 15,
                                                  textColor: ColorUtils.red,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                HorizontalSpace(width: 5),
                                                Icon(Icons.shopping_cart,color: ColorUtils.red,size: 18,)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ) ;
          },
        );
      },
    );
  }
}
