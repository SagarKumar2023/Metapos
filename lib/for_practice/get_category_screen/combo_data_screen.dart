// import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
// import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
// import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
// import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
// import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:get/get.dart';
// import 'getProduct_screen.dart';
// import 'get_category_screen.dart';
// import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
//
// class ComboDataScreen extends StatefulWidget {
//   const ComboDataScreen({super.key});
//
//   @override
//   State<ComboDataScreen> createState() => _ComboDataScreenState();
// }
//
// class _ComboDataScreenState extends State<ComboDataScreen> {
//   CategoryController categoryController = Get.put(CategoryController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     categoryController.comboDataList;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: MyText(
//         text: 'Combo Data List Screen',
//         fontSize: 18,
//         // textAlign: TextAlign.start,
//         textColor: ColorUtils.black,
//         softSwap: true,
//         fontWeight: FontWeight.bold,
//         overflow: TextOverflow.visible,
//       ),),
//       body:categoryController.isLoading ?Container(height: 130,width: screenWidth(context),color: ColorUtils.black.withOpacity(0.2),):
//       GetBuilder<CategoryController>(
//         init: categoryController,
//         builder: (catCtr) {
//           return ListView.builder(
//             itemCount: catCtr.comboDataList.length,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, comboDataIndex) {
//               List<CatComboDat>  comboData = catCtr.comboDataList ;
//               return Container(
//                 height: screenHeight(context)*0.7,
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(12),
//                 width: screenWidth(context)*0.7,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                     begin: Alignment(0.12, -1.0),
//                     end: Alignment(-1.0, 1.0),
//                     colors: [
//                       Color(0xFF965DE9),
//                       Color(0xFF6358EE),
//                     ],
//                     stops: [0.108, 0.943],
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       MyText(
//                         text: '${catCtr.comboDataList[comboDataIndex].desc}',
//                         fontSize: 14,
//                         // textAlign: TextAlign.start,
//                         textColor: ColorUtils.white,
//                         softSwap: true,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.visible,
//                       ),
//                       AllCategoriesText(
//                         title: 'Id',
//                         discription:'${catCtr.comboDataList[comboDataIndex].id}',
//                       ),
//                       AllCategoriesText(
//                         title: 'Name',
//                         discription:'${catCtr.comboDataList[comboDataIndex].name}',
//                       ),
//                       AllCategoriesText(
//                         title: 'Discount',
//                         discription: '${catCtr.comboDataList[comboDataIndex].discount}',
//                       ),
//                       AllCategoriesText(
//                         title: 'No Of Items',
//                         discription: '${catCtr.comboDataList[comboDataIndex].noOfItems}',
//                       ),
//                       AllCategoriesText(
//                         title: 'Amount',
//                         discription: '${catCtr.comboDataList[comboDataIndex].amount}',
//                       ),
//                       AllCategoriesText(
//                         title: 'All Category',
//                         discription: '${catCtr.comboDataList[comboDataIndex].allCategory}',
//                       ),
//                       MyText(
//                         text: 'Food List',
//                         fontSize: 14,
//                         // textAlign: TextAlign.start,
//                         textColor: ColorUtils.white,
//                         softSwap: true,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.visible,
//                       ),
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: comboData[comboDataIndex].foodList.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, foodListIndex) {
//                           return Container(
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(bottom: 8),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(11),
//                                 border: Border.all(color: ColorUtils.black)
//                             ),
//                             width: screenWidth(context),
//                             child: Column(
//                               children: [
//                                 Html(
//                                   data:comboData[comboDataIndex].foodList[foodListIndex].desc,
//                                   shrinkWrap: true,
//                                   style: {
//                                     "body": Style(
//                                       fontSize: FontSize(12.0), // in logical pixels
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     "p": Style(
//                                         fontSize: FontSize(10.0),
//                                         color: ColorUtils.white,
//                                         fontWeight: FontWeight.bold,
//                                         textAlign: TextAlign.center
//                                     ),
//                                     "strong": Style(
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                     "em": Style(
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   },
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Id',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].id}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Owner Id',
//                                   discription:"${comboData[comboDataIndex].foodList[foodListIndex].ownerId}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Old Id',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].oldId}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Updated At',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].updatedAt}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Created At',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].createdAt}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Sold Out',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].soldOut}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Name',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].name}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Image Id',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].imageid}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Sequence',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].sequence}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'OrderBeforeTime',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].orderBeforeTime}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'OrderBeforeDay',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].orderBeforeDay}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Is Catering',
//                                   discription: "${comboData[comboDataIndex].foodList[foodListIndex].isCatering}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Price',
//                                   discription: "\$ ${comboData[comboDataIndex].foodList[foodListIndex].price}",
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       MyText(
//                         text: 'Category List',
//                         fontSize: 14,
//                         // textAlign: TextAlign.start,
//                         textColor: ColorUtils.white,
//                         softSwap: true,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.visible,
//                       ),
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: comboData[comboDataIndex].categoryList.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, categoryListIndex) {
//                           // List<CategoryList> categoryList = [catCtr.comboDataList[categoryListIndex].categoryList[categoryListIndex]];
//                           return Container(
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(bottom: 8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(11),
//                               border: Border.all(color: ColorUtils.black)
//                             ),
//                             width: screenWidth(context),
//                             child: Column(
//                               children: [
//                                 MyText(
//                                   text: '${comboData[comboDataIndex].categoryList[categoryListIndex].desc}',
//                                   fontSize: 12,
//                                   // textAlign: TextAlign.start,
//                                   textColor: ColorUtils.white,
//                                   softSwap: true,
//                                   fontWeight: FontWeight.bold,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.visible,
//                                 ),
//                                 VerticalSpace(height: 12),                                AllCategoriesText(
//                                   title: 'Id',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].id}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Owner Id',
//                                   discription:"${comboData[comboDataIndex].categoryList[categoryListIndex].ownerId}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Old Id',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].oldId}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Updated At',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].updatedAt}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Created At',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].createdAt}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Restaurant Id',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].restaurantId}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Name',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].name}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Image Id',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].imageid}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Sequence',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].sequence}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Type',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].type}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Visible',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].visible}",
//                                 ),
//                                 // AllCategoriesText(
//                                 //   title: 'Is Catering',
//                                 //   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].isCatering}",
//                                 // ),
//                                 AllCategoriesText(
//                                   title: 'SegregatePrint',
//                                   discription: "${comboData[comboDataIndex].categoryList[categoryListIndex].segregatePrint}",
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       MyText(
//                         text: 'HalfN Half Data',
//                         fontSize: 14,
//                         // textAlign: TextAlign.start,
//                         textColor: ColorUtils.white,
//                         softSwap: true,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.visible,
//                       ),
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: catCtr.halfNHalfData.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, halfNHalfDataIndex) {
//                           // List<CategoryList> categoryList = [catCtr.comboDataList[categoryListIndex].categoryList[categoryListIndex]];
//                           return Container(
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(bottom: 8),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(11),
//                                 border: Border.all(color: ColorUtils.black)
//                             ),
//                             width: screenWidth(context),
//                             child: Column(
//                               children: [
//                                 MyText(
//                                   text: catCtr.halfNHalfData[halfNHalfDataIndex].desc,
//                                   fontSize: 12,
//                                   // textAlign: TextAlign.start,
//                                   textColor: ColorUtils.white,
//                                   softSwap: true,
//                                   fontWeight: FontWeight.bold,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.visible,
//                                 ),
//                                 VerticalSpace(height: 12),
//                                 AllCategoriesText(
//                                   title: 'Id',
//                                   discription: "${catCtr.halfNHalfData[halfNHalfDataIndex].id}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Name',
//                                   discription:catCtr.halfNHalfData[halfNHalfDataIndex].name,
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'this Price',
//                                   discription: "\$ ${catCtr.halfNHalfData[halfNHalfDataIndex].thisPrice}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Offer Price',
//                                   discription: "\$ ${catCtr.halfNHalfData[halfNHalfDataIndex].offeredPrice}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Variant',
//                                   discription: catCtr.halfNHalfData[halfNHalfDataIndex].variant,
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'All Food',
//                                   discription: "${catCtr.halfNHalfData[halfNHalfDataIndex].allFoods}",
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       MyText(
//                         text: 'Special Deal Data List',
//                         fontSize: 14,
//                         // textAlign: TextAlign.start,
//                         textColor: ColorUtils.white,
//                         softSwap: true,
//                         fontWeight: FontWeight.bold,
//                         overflow: TextOverflow.visible,
//                       ),
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: catCtr.specialDealDataList.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, specialDealDataListIndex) {
//                           // List<CategoryList> categoryList = [catCtr.comboDataList[categoryListIndex].categoryList[categoryListIndex]];
//                           return Container(
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(bottom: 8),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(11),
//                                 border: Border.all(color: ColorUtils.black)
//                             ),
//                             width: screenWidth(context),
//                             child: Column(
//                               children: [
//                                 MyText(
//                                   text: catCtr.specialDealDataList[specialDealDataListIndex].desc,
//                                   fontSize: 12,
//                                   // textAlign: TextAlign.start,
//                                   textColor: ColorUtils.white,
//                                   softSwap: true,
//                                   fontWeight: FontWeight.bold,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.visible,
//                                 ),
//                                 VerticalSpace(height: 12),
//                                 AllCategoriesText(
//                                   title: 'Id',
//                                   discription: "${catCtr.specialDealDataList[specialDealDataListIndex].id}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Name',
//                                   discription:catCtr.specialDealDataList[specialDealDataListIndex].name,
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Amount',
//                                   discription: "\$ ${catCtr.specialDealDataList[specialDealDataListIndex].amount}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Days',
//                                   discription: "${catCtr.specialDealDataList[specialDealDataListIndex].days}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Start Time',
//                                   discription: catCtr.specialDealDataList[specialDealDataListIndex].startTime,
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'End Time',
//                                   discription: "${catCtr.specialDealDataList[specialDealDataListIndex].endTime}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Option',
//                                   discription: "${catCtr.specialDealDataList[specialDealDataListIndex].options}",
//                                 ),
//
//                                 AllCategoriesText(
//                                   title: 'Is this Price',
//                                   discription: "\$ ${catCtr.specialDealDataList[specialDealDataListIndex].isThisPrice}",
//                                 ),
//                                 AllCategoriesText(
//                                   title: 'Save Amount',
//                                   discription: "\$ ${catCtr.specialDealDataList[specialDealDataListIndex].saveAmount}",
//                                 ),
//                                 MyText(
//                                   text: 'Deal Data',
//                                   fontSize: 12,
//                                   // textAlign: TextAlign.start,
//                                   textColor: ColorUtils.white,
//                                   softSwap: true,
//                                   fontWeight: FontWeight.bold,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.visible,
//                                 ),
//                                 ListView.builder(
//                                   physics: NeverScrollableScrollPhysics(),
//                                   itemCount: catCtr.specialDealDataList[specialDealDataListIndex].dealData.length,
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, dealDataIndex) {
//                                     return Container(
//                                       padding: EdgeInsets.all(8),
//                                       margin: EdgeInsets.only(bottom: 8),
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(11),
//                                           border: Border.all(color: ColorUtils.black)
//                                       ),
//                                       width: screenWidth(context),
//                                       child: Column(
//                                         children: [
//                                           AllCategoriesText(
//                                             title: 'No Of Item',
//                                             discription: catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].numberOfItem,
//                                           ),
//                                           AllCategoriesText(
//                                             title: 'Variant Name',
//                                             discription: catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].variantName,
//                                           ),
//                                           AllCategoriesText(
//                                             title: 'Category',
//                                             discription: catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].category,
//                                           ),
//                                           AllCategoriesText(
//                                             title: 'Default Product',
//                                             discription: catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].defaultProduct,
//                                           ),
//                                           MyText(
//                                             text: 'Food List',
//                                             fontSize: 14,
//                                             // textAlign: TextAlign.start,
//                                             textColor: ColorUtils.white,
//                                             softSwap: true,
//                                             fontWeight: FontWeight.bold,
//                                             overflow: TextOverflow.visible,
//                                           ),
//                                           ListView.builder(
//                                             physics: NeverScrollableScrollPhysics(),
//                                             itemCount: catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList.length,
//                                             shrinkWrap: true,
//                                             itemBuilder: (context, dflIndex) {
//                                               return GestureDetector(
//                                                 onTap: (){
//                                                   Navigator.push(context,MaterialPageRoute(builder: (context) => ProductScreen(
//                                                     catId :catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].category,
//                                                   ),));
//                                                 },
//                                                 child: Container(
//                                                   padding: EdgeInsets.all(8),
//                                                   margin: EdgeInsets.only(bottom: 8),
//                                                   decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius.circular(11),
//                                                       border: Border.all(color: ColorUtils.black)
//                                                   ),
//                                                   width: screenWidth(context),
//                                                   child: Column(
//                                                     children: [
//                                                       Html(
//                                                         data:catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].desc,
//                                                         shrinkWrap: true,
//                                                         style: {
//                                                           "body": Style(
//                                                             fontSize: FontSize(12.0), // in logical pixels
//                                                             color: Colors.black87,
//                                                             fontWeight: FontWeight.w400,
//                                                           ),
//                                                           "p": Style(
//                                                               fontSize: FontSize(10.0),
//                                                               color: ColorUtils.white,
//                                                               fontWeight: FontWeight.bold,
//                                                               textAlign: TextAlign.center
//                                                           ),
//                                                           "strong": Style(
//                                                             fontWeight: FontWeight.w700,
//                                                           ),
//                                                           "em": Style(
//                                                             fontStyle: FontStyle.italic,
//                                                           ),
//                                                         },
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Id',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].id}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Owner Id',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].ownerId}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Old Id',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].oldId}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Updated At',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].updatedAt}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Created At',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].createdAt}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Sold Out',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].soldOut}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Name',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].name}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Image Id',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].imageid}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Sequence',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].sequence}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'OrderBeforeTime',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].orderBeforeTime}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'OrderBeforeDay',
//                                                         discription:catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].orderBeforeDay,
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Is Catering',
//                                                         discription:"${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].isCatering}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Price',
//                                                         discription:"\$ ${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].price}",
//                                                       ),
//                                                       AllCategoriesText(
//                                                         title: 'Cat Id',
//                                                         discription:"\$ ${catCtr.specialDealDataList[specialDealDataListIndex].dealData[dealDataIndex].foodList[dflIndex].category}",
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       )
//     );
//   }
// }
