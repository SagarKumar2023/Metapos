import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/HALF_AND_HALF/Half_N_Half_view_screen.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:get/get.dart';

class HalfAndHalfDesign extends StatefulWidget {
  final CategoryController categoryController ;
  const HalfAndHalfDesign({super.key, required this.categoryController});

  @override
  State<HalfAndHalfDesign> createState() => _HalfAndHalfDesignState();
}

class _HalfAndHalfDesignState extends State<HalfAndHalfDesign> {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CategoryController>(
      init: categoryController,
      builder:(catCtr) {
        return catCtr.isLoading? SizedBox.shrink(): Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyText(
                text: 'Half And Half',
                fontSize: 25,
                // textAlign: TextAlign.start,
                textColor: ColorUtils.black,
                softSwap: true,
                overflow: TextOverflow.visible,
                fontWeight: FontWeight.w500,
              ),
            ),
            VerticalSpace(height: 5),
            CustomDividerWidget(),
            VerticalSpace(height: 10),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: catCtr.halfNHalfData.length,
              itemBuilder: (context, index) {
                // List<FoodList> foodListData = catCtr.halfNHalfData[index].foodList.toList();
                // CatFoodListWithDetails? foodListWithDetails ;
                return GestureDetector(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: HalfNHalfViewScreen(
                          pName : catCtr.halfNHalfData[index].name,
                          variant : catCtr.halfNHalfData[index].variant,
                          foodListData : catCtr.halfNHalfData[index].foodList,
                          productId : catCtr.halfNHalfData[index].id.toString(),
                          productDesc :catCtr.halfNHalfData[index].desc
                      ),
                      // screen: TraditionalLargeViewScreen(
                      //   pName : catCtr.halfNHalfData[index].name
                      // ),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12,left: 12,right: 12),
                    child: DottedBorder(
                      strokeWidth: 1.5,
                      dashPattern: [3,2],
                      radius: Radius.circular(12),
                      borderType: BorderType.RRect,
                      child: Container(
                        padding: const EdgeInsets.only(left: 12,top: 10,bottom: 10,right: 15),
                        decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        width: screenWidth(context),
                        child: Column(
                          children: [
                            // DividerWidget(height: 1.5),
                            SizedBox(
                              // padding: const EdgeInsets.all(12),
                              width: screenWidth(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: catCtr.halfNHalfData[index].name,
                                    fontSize: 16,
                                    textColor: ColorUtils.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  MyText(
                                    text: catCtr.halfNHalfData[index].desc,
                                    fontSize: 15,
                                    textColor: ColorUtils.black.withOpacity(0.85),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
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
  }
}