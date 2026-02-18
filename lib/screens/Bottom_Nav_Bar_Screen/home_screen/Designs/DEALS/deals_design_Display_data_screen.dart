import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/DEALS/deal_view_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/DEALS/deals_design.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:get/get.dart';

class DealsDesignDisplayData extends StatefulWidget {
  final CategoryController categoryController ;
  const DealsDesignDisplayData({super.key, required this.categoryController});

  @override
  State<DealsDesignDisplayData> createState() => _DealsDesignDisplayDataState();
}

class _DealsDesignDisplayDataState extends State<DealsDesignDisplayData> {
  CategoryController categoryController = Get.put(CategoryController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   categoryController.getAllCategoryData() ;
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: categoryController,
      builder: (catCtr) {
        return catCtr.isLoading? SizedBox.shrink():Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
              child: MyText(
                text: 'DEALS',
                fontSize: 25,
                // textAlign: TextAlign.start,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            // VerticalSpace(height: 5),
            CustomDividerWidget(),
            ListView.builder(
              itemCount:catCtr.dealDataList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                // List<DealData> dealData = catCtr.dealDataList[index].dealData ;
                return GestureDetector(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: DealViewScreen(
                        dealName :catCtr.dealDataList[index].name,
                        dealId :catCtr.dealDataList[index].id.toString(),
                        dealAmount : catCtr.dealDataList[index].amount,
                        dealData : catCtr.dealDataList[index].dealData,
                        dealDesc : catCtr.dealDataList[index].desc ,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: DealsDesign(
                      dealName: catCtr.dealDataList[index].name,
                      dealDesc: catCtr.dealDataList[index].desc,
                      dealPrice: '\$ ${catCtr.dealDataList[index].amount}'
                  ),
                );
              },
            ),
            // DividerWidget(),
          ],
        ) ;
      },
    );
  }
}
