import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/DEALS/deals_design.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/SPECIALS/special_deal_view_screen.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
class SpecialDesign extends StatefulWidget {
  final CategoryController categoryController ;
  const SpecialDesign({super.key, required this.categoryController});

  @override
  State<SpecialDesign> createState() => _SpecialDesignState();
}

class _SpecialDesignState extends State<SpecialDesign> {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: categoryController,
      builder: (catCtr) {
        return catCtr.isLoading? SizedBox.shrink(): Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
              child: MyText(
                text: 'Specials',
                fontSize: 25,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomDividerWidget(),
            ListView.builder(
              itemCount: catCtr.specialDealDataList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SpecialDealViewScreen(
                          dealName   :catCtr.specialDealDataList[index].name,
                          dealAmount :catCtr.specialDealDataList[index].amount,
                          dealData   :catCtr.specialDealDataList[index].dealData,
                          dealId     :catCtr.specialDealDataList[index].id.toString(),
                          dealDesc   :catCtr.specialDealDataList[index].desc
                      ),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: DealsDesign(
                      dealName: catCtr.specialDealDataList[index].name,
                      dealDesc: catCtr.specialDealDataList[index].desc,
                      dealPrice: '\$ ${catCtr.specialDealDataList[index].amount}'
                  ),
                );
              },
            ),
          ],
        ) ;
      },
    );
  }
}
