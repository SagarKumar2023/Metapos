import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class GetCategoryScreen extends StatefulWidget {
  const GetCategoryScreen({super.key});

  @override
  State<GetCategoryScreen> createState() => _GetCategoryScreenState();
}

class _GetCategoryScreenState extends State<GetCategoryScreen> {
  CategoryController categoryController = CategoryController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.getAllCategoryData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryController>(
        init: categoryController,
        builder: (catCtr) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'Data List',
                        fontSize: 18,
                        // textAlign: TextAlign.start,
                        textColor: ColorUtils.black,
                        softSwap: true,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ComboDataScreen(),));
                        },
                        child: MyText(
                          text: 'Combo Data List Screen',
                          fontSize: 18,
                          // textAlign: TextAlign.start,
                          textColor: ColorUtils.black,
                          softSwap: true,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(height: 10),
                  catCtr.isLoading ?Container(height: 130,width: screenWidth(context),color: ColorUtils.black.withOpacity(0.2),):
                  SizedBox(
                      height: 130,
                      width: screenWidth(context),
                      child: ListView.builder(
                        itemCount:catCtr.dataList.length,
                        scrollDirection:Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, dataListIndex) {
                          return   Container(
                            height: 130,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 8),
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment(0.12, -1.0),
                                end: Alignment(-1.0, 1.0),
                                colors: [
                                  Color(0xFF965DE9),
                                  Color(0xFF6358EE),
                                ],
                                stops: [0.108, 0.943],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Id :- ${catCtr.dataList[dataListIndex].id}',
                                  fontSize: 18,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.white,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                MyText(
                                  text: 'Name :- ${catCtr.dataList[dataListIndex].name}',
                                  fontSize: 18,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.white,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                MyText(
                                  text: 'Type :- ${catCtr.dataList[dataListIndex].type}',
                                  fontSize: 18,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.white,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                MyText(
                                  text: 'Sequence :- ${catCtr.dataList[dataListIndex].sequence}',
                                  fontSize: 18,
                                  // textAlign: TextAlign.start,
                                  textColor: ColorUtils.white,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            )
                          ) ;
                        },
                      )
                  ),
                  VerticalSpace(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'Other Data List',
                        fontSize: 18,
                        // textAlign: TextAlign.start,
                        textColor: ColorUtils.black,
                        softSwap: true,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HiveDatabaseS1(),));
                        },
                        child: MyText(
                          text: 'Hive Database =>',
                          fontSize: 18,
                          // textAlign: TextAlign.start,
                          textColor: ColorUtils.black,
                          softSwap: true,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(height: 8),
                  catCtr.isLoading ?Container(height: 130,width: screenWidth(context),color: ColorUtils.black.withOpacity(0.2),):
                  SizedBox(
                      height: 490,
                      width: screenWidth(context),
                      child: ListView.builder(
                        itemCount:catCtr.otherDataList.length,
                        scrollDirection:Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, otherDataListindex) {
                          List<CatOtherDataFoodList> foodList = catCtr.otherDataList[otherDataListindex].foodList;
                          // List<CatFoodList> foodList = catCtr.otherDataList[otherDataListindex].foodList;
                          List<CatSubCategoryNew> subCategoryNewList = catCtr.otherDataList[otherDataListindex].subCategoryNew ;
                          return Container(
                              height: 200,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 8),
                              width: screenWidth(context)*0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment(0.12, -1.0),
                                  end: Alignment(-1.0, 1.0),
                                  colors: [
                                    Color(0xFF965DE9),
                                    Color(0xFF6358EE),
                                  ],
                                  stops: [0.108, 0.943],
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Id :- ${catCtr.otherDataList[otherDataListindex].id}',
                                      fontSize: 18,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.white,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    MyText(
                                      text: 'Name :- ${catCtr.otherDataList[otherDataListindex].name}',
                                      fontSize: 18,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.white,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    MyText(
                                      text: 'Type :- ${catCtr.otherDataList[otherDataListindex].type}',
                                      fontSize: 18,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.white,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    MyText(
                                      text: 'Sequence :- ${catCtr.otherDataList[otherDataListindex].sequence}',
                                      fontSize: 18,
                                      // textAlign: TextAlign.start,
                                      textColor: ColorUtils.white,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Divider(),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: foodList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, foodListIndex) {
                                         return Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             MyText(
                                               text: '• Food List',
                                               fontSize: 18,
                                               // textAlign: TextAlign.start,
                                               textColor: ColorUtils.white,
                                               softSwap: true,
                                               overflow: TextOverflow.visible,
                                               fontWeight: FontWeight.bold,
                                             ),
                                             Container(
                                               padding: EdgeInsets.all(5),
                                               margin: EdgeInsets.only(bottom: 5),
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(12),
                                                   border: Border.all(color: ColorUtils.black.withOpacity(0.5),width: 1.2)
                                               ),
                                               child: Column(
                                                 children: [
                                                   Html(
                                                     data:catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].desc,
                                                     shrinkWrap: true,
                                                     style: {
                                                       "body": Style(
                                                         fontSize: FontSize(12.0), // in logical pixels
                                                         color: Colors.black87,
                                                         fontWeight: FontWeight.w400,
                                                       ),
                                                       "p": Style(
                                                           fontSize: FontSize(10.0),
                                                           color: ColorUtils.white,
                                                           fontWeight: FontWeight.bold,
                                                           textAlign: TextAlign.center
                                                       ),
                                                       "strong": Style(
                                                         fontWeight: FontWeight.w700,
                                                       ),
                                                       "em": Style(
                                                         fontStyle: FontStyle.italic,
                                                       ),
                                                     },
                                                   ),
                                                   Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       MyText(
                                                         text: '• ${catCtr.otherDataList[otherDataListindex].type}',
                                                         fontSize: 18,
                                                         // textAlign: TextAlign.start,
                                                         textColor: ColorUtils.white,
                                                         softSwap: true,
                                                         overflow: TextOverflow.visible,
                                                       ),
                                                       MyText(
                                                         text: '• Price',
                                                         fontSize: 18,
                                                         // textAlign: TextAlign.start,
                                                         textColor: ColorUtils.white,
                                                         softSwap: true,
                                                         overflow: TextOverflow.visible,
                                                       ),

                                                     ],
                                                   ),
                                                   AllCategoriesText(
                                                     title: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].name,
                                                     discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].price,
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Discount',
                                                     discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].discountprice,
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'CanDelivery',
                                                     discription: "${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].canDelivery}",
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'ChooseNumberItems',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].chooseNumberItems}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Category',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].category}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Weight',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].weight}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Nutritions',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].nutritions}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'OrderBeforeDay',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].orderBeforeTime}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'OrderBeforeTime',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].orderBeforeTime}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Quantity',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].prodQty}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Device Id',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].productKdsDevicesId}',
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             MyText(
                                               text: '• Food List With Details',
                                               fontSize: 18,
                                               // textAlign: TextAlign.start,
                                               textColor: ColorUtils.white,
                                               softSwap: true,
                                               overflow: TextOverflow.visible,
                                               fontWeight: FontWeight.bold,
                                             ),
                                             Container(
                                               padding: EdgeInsets.all(5),
                                               margin: EdgeInsets.only(bottom: 5),
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(12),
                                                   border: Border.all(color: ColorUtils.grey,width: 1.2)
                                               ),
                                               child: Column(
                                                 children: [
                                                   Html(
                                                     data:'${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.desc}',
                                                     shrinkWrap: true,
                                                     style: {
                                                       "body": Style(
                                                         fontSize: FontSize(12.0), // in logical pixels
                                                         color: Colors.black87,
                                                         fontWeight: FontWeight.w400,
                                                       ),
                                                       "p": Style(
                                                           fontSize: FontSize(10.0),
                                                           color: ColorUtils.white,
                                                           fontWeight: FontWeight.bold,
                                                           textAlign: TextAlign.center
                                                       ),
                                                       "strong": Style(
                                                         fontWeight: FontWeight.w700,
                                                       ),
                                                       "em": Style(
                                                         fontStyle: FontStyle.italic,
                                                       ),
                                                     },
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Id',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.id}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Name',
                                                     discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.name,
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Price',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.price}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Discount',
                                                     discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].discountprice,
                                                   ),

                                                   AllCategoriesText(
                                                     title: 'Quantity',
                                                     discription: '${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.prodQty}',
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'Sold Out',
                                                     discription: "${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].soldOut}",
                                                   ),
                                                   AllCategoriesText(
                                                     title: 'FoodAddOns',
                                                     discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.foodAddons,
                                                   ),
                                                   MyText(
                                                     text: '->Contains :- ${catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails!.containsData}',
                                                     fontSize: 10,
                                                     // textAlign: TextAlign.start,
                                                     textColor: ColorUtils.white,
                                                     softSwap: true,
                                                     overflow: TextOverflow.visible,
                                                     fontWeight: FontWeight.bold,
                                                   ),

                                                   MyText(
                                                     text: '• food bundle prices List',
                                                     fontSize: 18,
                                                     // textAlign: TextAlign.start,
                                                     textColor: ColorUtils.white,
                                                     softSwap: true,
                                                     overflow: TextOverflow.visible,
                                                     fontWeight: FontWeight.bold,
                                                   ),
                                                   // ListView.builder(
                                                   //   physics: NeverScrollableScrollPhysics(),
                                                   //   itemCount: foodList[foodListIndex].foodListWithDetails.foodBundlePrices!.length,
                                                   //   shrinkWrap: true,
                                                   //   itemBuilder: (context, foodBundlePricesIndex) {
                                                   //     List<FoodBundlePrice> foodBundleData = [foodList[foodListIndex].foodListWithDetails.foodBundlePrices![foodBundlePricesIndex]];
                                                   //     return Column(
                                                   //       children: [
                                                   //         AllCategoriesText(
                                                   //           title: 'Id',
                                                   //           discription: "${foodBundleData[foodBundlePricesIndex].id}",
                                                   //         ),
                                                   //         AllCategoriesText(
                                                   //           title: 'FoodAddOns',
                                                   //           discription: catCtr.otherDataList[otherDataListindex].foodList[foodListIndex].foodListWithDetails.foodAddons,
                                                   //         ),
                                                   //       ],
                                                   //     );
                                                   //
                                                   //   },
                                                   // ),




                                                   MyText(
                                                     text: '• Contains Data List',
                                                     fontSize: 18,
                                                     // textAlign: TextAlign.start,
                                                     textColor: ColorUtils.white,
                                                     softSwap: true,
                                                     overflow: TextOverflow.visible,
                                                     fontWeight: FontWeight.bold,
                                                   ),
                                                   ListView.builder(
                                                     physics: NeverScrollableScrollPhysics(),
                                                     itemCount: foodList[foodListIndex].foodListWithDetails!.containsData!.length,
                                                     shrinkWrap: true,
                                                     itemBuilder: (context, containDataIndex) {
                                                        String containData = foodList[foodListIndex].foodListWithDetails!.containsData![containDataIndex] ;
                                                       return Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           MyText(
                                                             text: '• $containData',
                                                             fontSize: 12,
                                                             // textAlign: TextAlign.start,
                                                             textColor: ColorUtils.white,
                                                             softSwap: true,
                                                             overflow: TextOverflow.visible,
                                                             fontWeight: FontWeight.bold,
                                                           ),
                                                         ],
                                                       );
                                                     },
                                                   ),
                                                   // MyText(
                                                   //   text: '• addonsDataArray List',
                                                   //   fontSize: 18,
                                                   //   // textAlign: TextAlign.start,
                                                   //   textColor: ColorUtils.white,
                                                   //   softSwap: true,
                                                   //   overflow: TextOverflow.visible,
                                                   //   fontWeight: FontWeight.bold,
                                                   // ),
                                                   // ListView.builder(
                                                   //   physics: NeverScrollableScrollPhysics(),
                                                   //   itemCount: catCtr.otherDataList[index].foodList[i].foodListWithDetails.addonsDataArray!.length,
                                                   //   shrinkWrap: true,
                                                   //   itemBuilder: (context, addonindex) {
                                                   //     List<AddonsDataArray> addonDataArray = [foodList[i].foodListWithDetails.addonsDataArray![addonindex]] ;
                                                   //     return Column(
                                                   //       crossAxisAlignment: CrossAxisAlignment.start,
                                                   //       children: [
                                                   //         MyText(
                                                   //           text: '• AddOn ID => ${addonDataArray[addonindex].addonsId}',
                                                   //           fontSize: 12,
                                                   //           // textAlign: TextAlign.start,
                                                   //           textColor: ColorUtils.white,
                                                   //           softSwap: true,
                                                   //           overflow: TextOverflow.visible,
                                                   //           fontWeight: FontWeight.bold,
                                                   //         ),
                                                   //         MyText(
                                                   //           text: '• Name => ${addonDataArray[addonindex].addonsName}',
                                                   //           fontSize: 12,
                                                   //           // textAlign: TextAlign.start,
                                                   //           textColor: ColorUtils.white,
                                                   //           softSwap: true,
                                                   //           overflow: TextOverflow.visible,
                                                   //           fontWeight: FontWeight.bold,
                                                   //         ),
                                                   //         MyText(
                                                   //           text: '• Price => ${addonDataArray[addonindex].addonsPrice}',
                                                   //           fontSize: 12,
                                                   //           // textAlign: TextAlign.start,
                                                   //           textColor: ColorUtils.white,
                                                   //           softSwap: true,
                                                   //           overflow: TextOverflow.visible,
                                                   //           fontWeight: FontWeight.bold,
                                                   //         ),
                                                   //       ],
                                                   //     );
                                                   //   },
                                                   // ),
                                                 ],
                                               ),
                                             ),
                                             MyText(
                                               text: '• Variant Data List',
                                               fontSize: 18,
                                               // textAlign: TextAlign.start,
                                               textColor: ColorUtils.white,
                                               softSwap: true,
                                               overflow: TextOverflow.visible,
                                               fontWeight: FontWeight.bold,
                                             ),
                                             ListView.builder(
                                               physics: NeverScrollableScrollPhysics(),
                                               itemCount: foodList[foodListIndex].foodListWithDetails!.variantDataArray!.length,
                                               shrinkWrap: true,
                                               itemBuilder: (context, vdaIndex) {
                                                 String variantName = foodList[foodListIndex].foodListWithDetails!.variantDataArray![vdaIndex].variantName ;
                                                 return Column(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     MyText(
                                                       text: variantName,
                                                       fontSize: 18,
                                                       // textAlign: TextAlign.start,
                                                       textColor: ColorUtils.white,
                                                       softSwap: true,
                                                       overflow: TextOverflow.visible,
                                                       fontWeight: FontWeight.bold,
                                                     ),
                                                     ListView.builder(
                                                       physics: NeverScrollableScrollPhysics(),
                                                       itemCount: foodList[foodListIndex].foodListWithDetails!.variantDataArray![vdaIndex].variantDetail.length,
                                                       shrinkWrap: true,
                                                       itemBuilder: (context, vdIndex) {
                                                         List<CatVariantDetail> variantDetails = foodList[foodListIndex].foodListWithDetails!.variantDataArray![vdaIndex].variantDetail ;
                                                         return Container(
                                                           padding: EdgeInsets.all(5),
                                                           margin: EdgeInsets.only(bottom: 5),
                                                           decoration: BoxDecoration(
                                                               borderRadius: BorderRadius.circular(12),
                                                               border: Border.all(color: ColorUtils.grey,width: 1.2)
                                                           ),
                                                           child: Column(
                                                             children: [
                                                               AllCategoriesText(
                                                                 title: 'Id',
                                                                 discription: '${variantDetails[vdIndex].id}',
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'Name',
                                                                 discription: variantDetails[vdIndex].name,
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'CreatedAt',
                                                                 discription: variantDetails[vdIndex].createdAt,
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'Updated At',
                                                                 discription: variantDetails[vdIndex].updatedAt,
                                                               ),

                                                               AllCategoriesText(
                                                                 title: 'Variant Type',
                                                                 discription: variantDetails[vdIndex].variantType,
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'Price',
                                                                 discription: variantDetails[vdIndex].price,
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'Disc Price',
                                                                 discription: variantDetails[vdIndex].dprice,
                                                               ),
                                                               AllCategoriesText(
                                                                 title: 'Quantity',
                                                                 discription: "${variantDetails[vdIndex].prod_qty}",
                                                               ),
                                                             ],
                                                           ),
                                                         );
                                                       },
                                                     )
                                                   ],
                                                 );
                                               },
                                             )
                                           ],
                                         );
                                      },
                                    )
                                  ],
                                ),
                              )
                          ) ;
                        },
                      )
                  ),
                  VerticalSpace(height: 20),
                  // MyText(
                  //   text: 'Food List',
                  //   fontSize: 18,
                  //   // textAlign: TextAlign.start,
                  //   textColor: ColorUtils.black,
                  //   softSwap: true,
                  //   fontWeight: FontWeight.bold,
                  //   overflow: TextOverflow.visible,
                  // ),
                  // VerticalSpace(height: 10),
                  // catCtr.isLoading ?Container(height: 130,width: screenWidth(context),color: ColorUtils.black.withOpacity(0.2),):
                  // SizedBox(
                  //     height: 130,
                  //     width: screenWidth(context),
                  //     child: ListView.builder(
                  //       // physics: NeverScrollableScrollPhysics(),
                  //       itemCount:catCtr.otherDataList.length,
                  //       scrollDirection:Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, i) {
                  //         List<FoodList> foodList = catCtr.otherDataList[i].foodList ;
                  //         return   Container(
                  //             height: 130,
                  //             padding: EdgeInsets.all(10),
                  //             margin: EdgeInsets.only(right: 8),
                  //             width: screenWidth(context),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               gradient: LinearGradient(
                  //                 begin: Alignment(0.12, -1.0),
                  //                 end: Alignment(-1.0, 1.0),
                  //                 colors: [
                  //                   Color(0xFF965DE9),
                  //                   Color(0xFF6358EE),
                  //                 ],
                  //                 stops: [0.108, 0.943],
                  //               ),
                  //             ),
                  //
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 ListView.builder(
                  //                   shrinkWrap: true,
                  //                   // physics: NeverScrollableScrollPhysics(),
                  //                   itemBuilder: (context, index) {
                  //                     return Column(
                  //                       children: [
                  //                         MyText(
                  //                           text: 'Id :- ${foodList[index].id}',
                  //                           fontSize: 18,
                  //                           // textAlign: TextAlign.start,
                  //                           textColor: ColorUtils.white,
                  //                           softSwap: true,
                  //                           overflow: TextOverflow.visible,
                  //                         ),
                  //                         MyText(
                  //                           text: 'Name :- ${foodList[index].name}',
                  //                           fontSize: 18,
                  //                           // textAlign: TextAlign.start,
                  //                           textColor: ColorUtils.white,
                  //                           softSwap: true,
                  //                           overflow: TextOverflow.visible,
                  //                         ),
                  //                         MyText(
                  //                           text: 'CreatedAt :- ${foodList[index].createdAt}',
                  //                           fontSize: 18,
                  //                           // textAlign: TextAlign.start,
                  //                           textColor: ColorUtils.white,
                  //                           softSwap: true,
                  //                           overflow: TextOverflow.visible,
                  //                         ),
                  //                         MyText(
                  //                           text: 'Sequence :- ${catCtr.otherDataList[index].sequence}',
                  //                           fontSize: 18,
                  //                           // textAlign: TextAlign.start,
                  //                           textColor: ColorUtils.white,
                  //                           softSwap: true,
                  //                           overflow: TextOverflow.visible,
                  //                         ),
                  //                       ],
                  //                     );
                  //                   },
                  //                 ),
                  //               ],
                  //             )
                  //         ) ;
                  //       },
                  //     )
                  // ),

                ],
              ),
            ),
          ) ;
        },
      ),
    );
  }
}

class AllCategoriesText extends StatelessWidget {
  final String title ;
  final String  discription;

  const AllCategoriesText({super.key, required this.title, required this.discription});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: '-> $title',
          fontSize: 12,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.white,
          softSwap: true,
          overflow: TextOverflow.visible,
        ),
        MyText(
          text: ' $discription',
          fontSize: 12,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.white,
          softSwap: true,
          overflow: TextOverflow.visible,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

