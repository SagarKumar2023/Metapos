
// class CategoriesFoodListview extends StatefulWidget {
//   final FoodListWithDetails foodListDetails ;
//   const CategoriesFoodListview({super.key,required this.foodListDetails});
//
//   @override
//   State<CategoriesFoodListview> createState() => _CategoriesFoodListviewState();
// }
//
// class _CategoriesFoodListviewState extends State<CategoriesFoodListview> {
//   String? variantLargeSelect ;
//   String? variantOptionSelect ;
//   String? variantXLargeSelect ;
//   List<String> selectedAddons = [];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> containsData = widget.foodListDetails.containsData ?? [];
//     return Scaffold(
//       backgroundColor: ColorUtils.white,
//       bottomSheet: Container(
//         height: 80,
//         padding: EdgeInsets.only(top: 10,bottom: 10,right: 14,left: 14),
//         width: screenWidth(context),
//         decoration: BoxDecoration(
//           color: ColorUtils.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 6,
//               offset: Offset(0, -3),
//             ),
//           ],
//         ),
//         child: MyButton(
//             buttonColor: Colors.red,
//             navigateTo: (){},
//             buttonName: 'Add To Cart'),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             floating: false,
//             snap: false,
//             // toolbarHeight: 0,
//             backgroundColor: ColorUtils.black,
//             expandedHeight: 200,
//             automaticallyImplyLeading: false,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: true,
//               title: MyText(
//                 text: widget.foodListDetails.name,
//                 fontSize: 20,
//                 textColor: ColorUtils.white,
//                 softSwap: true,
//                 overflow: TextOverflow.visible,
//                 fontWeight: FontWeight.bold,
//               ),
//
//               background: Container(
//                 height: 200,
//                 width: screenWidth(context),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(20),
//                     bottomLeft: Radius.circular(20),
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/pizza_view.jpg'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Container(
//                   height: 200,
//                   padding: EdgeInsets.only(left: 12,right: 12,bottom: 40),
//                   width: screenWidth(context),
//                   decoration: BoxDecoration(
//                     color: ColorUtils.black.withOpacity(0.1),
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     ),
//                   ),
//                   child: SafeArea(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: (){Navigator.pop(context);},
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 padding: EdgeInsets.only(left: 10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border: Border.all(color: ColorUtils.black.withOpacity(0.3), width: 0.7),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       blurRadius: 6,
//                                       offset: Offset(2, 4),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Icon(Icons.arrow_back_ios),
//                               ),
//                             ),
//                             Container()
//
//                           ],
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//               delegate:SliverChildListDelegate(
//                   [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
//                           child: MyText(
//                             text:widget.foodListDetails.name,
//                             fontSize: 20,
//                             textColor: ColorUtils.black,
//                             softSwap: true,
//                             overflow: TextOverflow.visible,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Html(
//                           data: widget.foodListDetails.desc,
//                           shrinkWrap: true,
//                           style: {
//                             "body": Style(
//                               fontSize: FontSize(14.0),
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w400,
//                             ),
//                             "p": Style.fromTextStyle(
//                               GoogleFonts.vidaloka(
//                                 textStyle: TextStyle(
//                                   fontSize: 14.0,
//                                   color: ColorUtils.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ).copyWith(textAlign: TextAlign.start),
//                             "strong": Style(
//                               fontWeight: FontWeight.w700,
//                             ),
//                             "em": Style(
//                               fontStyle: FontStyle.italic,
//                             ),
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: MyText(
//                             text: '\$ ${widget.foodListDetails.price}',
//                             fontSize: 16,
//                             textColor: ColorUtils.black.withOpacity(0.85),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: ListView.builder(
//                            shrinkWrap: true,
//                            physics: NeverScrollableScrollPhysics(),
//                            padding: EdgeInsets.zero,
//                            itemCount: widget.foodListDetails.variantDataArray!.length,
//                            itemBuilder: (context, variantDataIndex) {
//                              final data = widget.foodListDetails.variantDataArray![variantDataIndex] ;
//                              return Column(
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: [
//                                  MyText(
//                                    text: "Variant ${data.variantName}",
//                                    fontSize: 20,
//                                    textColor: ColorUtils.black,
//                                    softSwap: true,
//                                    overflow: TextOverflow.visible,
//                                    fontWeight: FontWeight.w500,
//                                  ),
//                                  VerticalSpace(height: 5),
//                                  CustomDividerWidget(),
//                                  VerticalSpace(height: 10),
//
//                                  if (data.variantName == "Large") ...[
//                                    ListView.builder(
//                                      shrinkWrap: true,
//                                      physics: NeverScrollableScrollPhysics(),
//                                      padding: EdgeInsets.zero,
//                                      itemCount: data.variantDetail.length,
//                                      itemBuilder: (context, variantDetailsIndex) {
//                                        final variantDetailsData = data.variantDetail[variantDetailsIndex];
//                                        return Padding(
//                                          padding: const EdgeInsets.only(bottom: 12),
//                                            child:GestureDetector(
//                                              onTap: (){
//                                                setState(() {
//                                                  variantLargeSelect = variantDetailsData.name;
//                                                });
//                                              },
//                                              child: variantLargeWidget(label: variantDetailsData.name,price: '\$ ${variantDetailsData.price}'),
//                                            )
//                                          // child: variantLargeWidget(label: variantDetailsData.name,price: '\$ ${variantDetailsData.price}'),
//                                        );
//                                      },
//                                    ),
//                                  ] else if (data.variantName == "Options") ...[
//                                    ListView.builder(
//                                      shrinkWrap: true,
//                                      physics: NeverScrollableScrollPhysics(),
//                                      padding: EdgeInsets.zero,
//                                      itemCount: data.variantDetail.length,
//                                      itemBuilder: (context, variantDetailsIndex) {
//                                        final variantDetailsData = data.variantDetail[variantDetailsIndex];
//                                        return Padding(
//                                          padding: const EdgeInsets.only(bottom: 12),
//                                          child:variantOptionWidget(label:variantDetailsData.name)
//                                        );
//                                      },
//                                    ),
//                                  ] else if (data.variantName == "X-Large") ...[
//                                    ListView.builder(
//                                      shrinkWrap: true,
//                                      physics: NeverScrollableScrollPhysics(),
//                                      padding: EdgeInsets.zero,
//                                      itemCount: data.variantDetail.length,
//                                      itemBuilder: (context, variantDetailsIndex) {
//                                        final variantDetailsData = data.variantDetail[variantDetailsIndex];
//                                        return Padding(
//                                          padding: const EdgeInsets.only(bottom: 12),
//                                          child: variantXLargeWidget(label: variantDetailsData.name, price: variantDetailsData.price)
//                                        );
//                                      },
//                                    ),
//                                  ]
//                                ],
//                              );
//                            },
//                          ),
//                        ),
//
//                         VerticalSpace(height: 10),
//                         // if(selectedAddons.isNotEmpty)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: MyText(
//                                 text:'Addons',
//                                 fontSize: 20,
//                                 textColor: ColorUtils.black,
//                                 softSwap: true,
//                                 overflow: TextOverflow.visible,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Center(child: CustomDividerWidget()),
//                           ],
//                         ),
//                         VerticalSpace(height: 10),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           itemCount: widget.foodListDetails.addonsDataArray!.length,
//                           itemBuilder: (context, addonsDataIndex) {
//                             final addonData = widget.foodListDetails.addonsDataArray![addonsDataIndex];
//                             final isChecked = selectedAddons.contains(addonData.addonsName);                            return Padding(
//                               padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     if (isChecked) {
//                                       selectedAddons.remove(addonData.addonsName);
//                                     } else {
//                                       selectedAddons.add(addonData.addonsName.toString());
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.only(right: 15,top:3,bottom: 3),
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     // color: ColorUtils.black.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(50),
//                                       border:  Border.all(color: ColorUtils.black)
//
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                         activeColor: ColorUtils.green,
//                                         value: isChecked,
//                                         onChanged: (value) {
//                                           setState(() {
//                                             if (value == true) {
//                                               selectedAddons.add(addonData.addonsName.toString());
//                                             } else {
//                                               selectedAddons.remove(addonData.addonsName);
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       MyText(
//                                         text: addonData.addonsName,
//                                         fontSize: 16,
//                                         textColor: ColorUtils.black,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       Spacer(),
//                                       MyText(
//                                         text: addonData.addonsPrice,
//                                         fontSize: 16,
//                                         textColor: ColorUtils.black,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         VerticalSpace(height: 10),
//                         if(containsData.isNotEmpty)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: MyText(
//                                 text:'Remove',
//                                 fontSize: 20,
//                                 textColor: ColorUtils.black,
//                                 softSwap: true,
//                                 overflow: TextOverflow.visible,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Center(child: CustomDividerWidget()),
//                           ],
//                         ),
//                         VerticalSpace(height: 10),
//
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           itemCount: containsData.length,
//                           itemBuilder: (context, index) {
//                             final String item = containsData[index];
//                             final bool isChecked = selectedAddons.contains(item);
//
//                             return Padding(
//                               padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     if (isChecked) {
//                                       selectedAddons.remove(item);
//                                     } else {
//                                       selectedAddons.add(item);
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.only(right: 15, top: 3, bottom: 3),
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     border: Border.all(color: ColorUtils.black),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                         activeColor: ColorUtils.green,
//                                         value: isChecked,
//                                         onChanged: (value) {
//                                           setState(() {
//                                             if (value == true) {
//                                               selectedAddons.add(item);
//                                             } else {
//                                               selectedAddons.remove(item);
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       MyText(
//                                         text: item,
//                                         fontSize: 16,
//                                         textColor: ColorUtils.black,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       Spacer(),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         VerticalSpace(height: 80),
//                       ],
//                     )
//                   ]
//               )
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget variantLargeWidget({required String label,required String price,}) {
//     bool isSelected = variantLargeSelect == label;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           variantLargeSelect = label;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//         // width: double.infinity,
//         decoration: BoxDecoration(
//             color: isSelected ? ColorUtils.green : Colors.transparent,
//             borderRadius: BorderRadius.circular(50),
//             border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             MyText(
//               text: label,
//               fontSize: 16,
//               textColor: isSelected?ColorUtils.white:ColorUtils.black,
//               fontWeight: FontWeight.w500,
//             ),
//             MyText(
//               text: price,
//               fontSize: 16,
//               textColor: isSelected?ColorUtils.white:ColorUtils.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget variantOptionWidget({required String label,}) {
//     bool isSelected = variantOptionSelect == label;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           variantOptionSelect = label;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//         // width: double.infinity,
//         decoration: BoxDecoration(
//             color: isSelected ? ColorUtils.green : Colors.transparent,
//             borderRadius: BorderRadius.circular(50),
//             border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
//         ),
//         child: MyText(
//           text: label,
//           fontSize: 16,
//           textColor: isSelected?ColorUtils.white:ColorUtils.black,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
//
//   Widget variantXLargeWidget({required String label,required String price,}) {
//     bool isSelected = variantXLargeSelect == label;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           variantXLargeSelect = label;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//         // width: double.infinity,
//         decoration: BoxDecoration(
//             color: isSelected ? ColorUtils.green : Colors.transparent,
//             borderRadius: BorderRadius.circular(50),
//             border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             MyText(
//               text: label,
//               fontSize: 16,
//               textColor: isSelected?ColorUtils.white:ColorUtils.black,
//               fontWeight: FontWeight.w500,
//             ),
//             MyText(
//               text: price,
//               fontSize: 16,
//               textColor: isSelected?ColorUtils.white:ColorUtils.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }

import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Add_To_Cart/CategoryAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/getProductDetailsController.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/CustomLoader.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MySnackbar.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CategoriesFoodListview extends StatefulWidget {
  final String id ;
  const CategoriesFoodListview({super.key, required this.id});

  @override
  State<CategoriesFoodListview> createState() => _CategoriesFoodListviewState();
}

class _CategoriesFoodListviewState extends State<CategoriesFoodListview> {
  List<String> selectedAddons = [];
  double totalAddonPrice = 0.0;

  GetProductDetailsController getProductDetailsController = Get.put(GetProductDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDetailsController.getProductDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> containsData = widget.foodListDetails.containsData ?? [];
    return Scaffold(
      backgroundColor: ColorUtils.white,
      bottomSheet: WillPopScope(
        onWillPop: () async {
          Get.delete<GetProductDetailsController>();
          return true;
        },
        child: GetBuilder<GetProductDetailsController>(
          init: getProductDetailsController,
          autoRemove: true,
          builder: (controller) {
            return  Container(
              height: 80,
              padding: EdgeInsets.only(top: 10,bottom: 10,right: 14,left: 14),
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: ColorUtils.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: MyButton(
                  buttonColor: Colors.red,
                  navigateTo: (){
                    final box  = HiveBoxes.categoryAddToCartDB();
                    // Check if this dealId already exists
                    final isAlreadyAdded = box.values.any((element) => element.id == widget.id);
                    if (isAlreadyAdded) {
                      MySnackbar.showWarning(context: context, message: "You've already added this! Check your cart to update it.");
                      // return;
                    }else{
                      final model = CategoryAddToCartDBModel(
                        id: int.parse(widget.id),
                        productName: controller.productDetailData!.name,
                        productPrice: controller.productDetailData!.price,
                        productTotalPrice: '${controller.totalPrice}',
                        variantOptionSelectedName: controller.variantOptionSelect.toString(),
                        desc: controller.productDetailData!.desc,
                      );
                      box.add(model);
                      MySnackbar.showSuccess(context: context, message: "Added to cart. You can view it anytime from your cart.");
                      Navigator.pop(context);
                    }
                  },
                  buttonName: 'Add To Cart \$ ${controller.totalPrice}'),
            ) ;
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.delete<GetProductDetailsController>();
          return true;
        },
        child: GetBuilder<GetProductDetailsController>(
          init: getProductDetailsController,
          builder: (getPCtr) {
            final seenAddonNames = <String>{};
            final filteredAddonList = getPCtr.addonDataArray.where((addon) {
              if (seenAddonNames.contains(addon.addonsName)) {
                return false;
              } else {
                seenAddonNames.add(addon.addonsName);
                return true;
              }
            }).toList();

            return getPCtr.isLoading? CustomLoader() :CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  // toolbarHeight: 0,
                  backgroundColor: ColorUtils.black,
                  expandedHeight: 200,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: MyText(
                      text: getPCtr.productDetailData!.name,
                      fontSize: 18,
                      textColor: ColorUtils.white,
                      softSwap: true,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,
                    ),
                    background: Container(
                      height: 200,
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/pizza_view.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        height: 200,
                        padding: EdgeInsets.only(left: 12,right: 12,bottom: 40),
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                          color: ColorUtils.black.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){Navigator.pop(context);},
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: ColorUtils.black.withOpacity(0.3), width: 0.7),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 6,
                                            offset: Offset(2, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.arrow_back_ios),
                                    ),
                                  ),
                                  Container()
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate:SliverChildListDelegate(
                        [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                child: MyText(
                                  text:getPCtr.productDetailData!.name,
                                  fontSize: 20,
                                  textColor: ColorUtils.black,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Html(
                                data: getPCtr.productDetailData!.desc,
                                shrinkWrap: true,
                                style: {
                                  "body": Style(
                                    fontSize: FontSize(14.0),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  "p": Style.fromTextStyle(
                                    GoogleFonts.vidaloka(
                                      textStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: ColorUtils.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ).copyWith(textAlign: TextAlign.start),
                                  "strong": Style(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  "em": Style(
                                    fontStyle: FontStyle.italic,
                                  ),
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: MyText(
                                  text: '\$ ${getPCtr.productDetailData!.price}',
                                  fontSize: 16,
                                  textColor: ColorUtils.black.withOpacity(0.85),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              if(getPCtr.variantDataArray.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ...getPCtr.variantDataArray.map((data) {
                                        /// ✅ Auto-select for Large
                                        if (data.variantName == "Large" &&
                                            getPCtr.variantLargeSelect.isEmpty &&
                                            data.variantDetail.isNotEmpty) {
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            if (getPCtr.variantLargeSelect.isEmpty) {
                                              getPCtr.variantLargeFunction(
                                                data.variantDetail[0].name,
                                                data.variantDetail[0].price,
                                              );
                                            }
                                          });
                                        }

                                        /// ✅ Auto-select for X-Large
                                        if (data.variantName == "X-Large" &&
                                            (getPCtr.variantXLargeSelect?.isEmpty ?? true) &&
                                            data.variantDetail.isNotEmpty) {
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            if ((getPCtr.variantXLargeSelect?.isEmpty ?? true)) {
                                              getPCtr.variantXLargeFunction(data.variantDetail[0].name);
                                            }
                                          });
                                        }

                                        /// 🟢 UI for Large Variant
                                        if (data.variantName == "Large") {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              MyText(
                                                text: "Variant ${data.variantName}",
                                                fontSize: 20,
                                                textColor: ColorUtils.black,
                                                softSwap: true,
                                                overflow: TextOverflow.visible,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              VerticalSpace(height: 5),
                                              CustomDividerWidget(),
                                              VerticalSpace(height: 10),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: data.variantDetail.length,
                                                itemBuilder: (context, variantDetailsIndex) {
                                                  final variantDetailsData = data.variantDetail[variantDetailsIndex];
                                                  return Padding(
                                                    padding: const EdgeInsets.only(bottom: 12),
                                                    child: variantLargeWidget(
                                                      label: variantDetailsData.name,
                                                      price: '\$ ${variantDetailsData.price}',
                                                      controller: getPCtr,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        }

                                        /// 🟢 UI for X-Large Variant
                                        if (data.variantName == "X-Large") {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              MyText(
                                                text: "Variant ${data.variantName}",
                                                fontSize: 20,
                                                textColor: ColorUtils.black,
                                                softSwap: true,
                                                overflow: TextOverflow.visible,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              VerticalSpace(height: 5),
                                              CustomDividerWidget(),
                                              VerticalSpace(height: 10),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: data.variantDetail.length,
                                                itemBuilder: (context, variantDetailsIndex) {
                                                  final variantDetailsData = data.variantDetail[variantDetailsIndex];
                                                  return Padding(
                                                    padding: const EdgeInsets.only(bottom: 12),
                                                    child: variantXLargeWidget(
                                                      label: variantDetailsData.name,
                                                      price: variantDetailsData.price,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        }

                                        return const SizedBox.shrink(); // Skip others
                                      }).toList(),

                                      /// 🟡 Options Variant - Only once
                                      Builder(
                                        builder: (context) {
                                          final allOptionVariants = getPCtr.variantDataArray
                                              .where((e) => e.variantName == "Options")
                                              .expand((e) => e.variantDetail)
                                              .toList();

                                          final seen = <String>{};
                                          final filteredOptionList = allOptionVariants.where((variant) {
                                            if (seen.contains(variant.name)) return false;
                                            seen.add(variant.name);
                                            return true;
                                          }).toList();

                                          /// ✅ Auto-select first Option (safe)
                                          if (getPCtr.variantOptionSelect == null && filteredOptionList.isNotEmpty) {
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              if (getPCtr.variantOptionSelect == null) {
                                                getPCtr.variantOptionFunction(filteredOptionList.first.name);
                                              }
                                            });
                                          }

                                          if (filteredOptionList.isEmpty) return const SizedBox.shrink();

                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              MyText(
                                                text: "Variant Options",
                                                fontSize: 20,
                                                textColor: ColorUtils.black,
                                                softSwap: true,
                                                overflow: TextOverflow.visible,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              VerticalSpace(height: 5),
                                              CustomDividerWidget(),
                                              VerticalSpace(height: 10),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: filteredOptionList.length,
                                                itemBuilder: (context, index) {
                                                  final variant = filteredOptionList[index];
                                                  return Padding(
                                                    padding: const EdgeInsets.only(bottom: 12),
                                                    child: variantOptionWidget(label: variant.name),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),

                              // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       /// Loop for Large & X-Large Variants
                                //       ...getPCtr.variantDataArray.map((data) {
                                //         // Auto-select for Large
                                //         if (data.variantName == "Large" &&
                                //             getPCtr.variantLargeSelect.isEmpty &&
                                //             data.variantDetail.isNotEmpty) {
                                //           WidgetsBinding.instance.addPostFrameCallback((_) {
                                //             if (getPCtr.variantLargeSelect.isEmpty) {
                                //               getPCtr.variantLargeFunction(
                                //                 data.variantDetail[0].name,
                                //                 data.variantDetail[0].price,
                                //               );
                                //             }
                                //           });
                                //         }
                                //
                                //         // Auto-select for X-Large
                                //         if (data.variantName == "X-Large" &&
                                //             (getPCtr.variantXLargeSelect?.isEmpty ?? true) &&
                                //             data.variantDetail.isNotEmpty) {
                                //           WidgetsBinding.instance.addPostFrameCallback((_) {
                                //             if ((getPCtr.variantXLargeSelect?.isEmpty ?? true)) {
                                //               getPCtr.variantXLargeFunction(data.variantDetail[0].name);
                                //             }
                                //           });
                                //         }
                                //
                                //         if (data.variantName == "Large") {
                                //           return Column(
                                //             crossAxisAlignment: CrossAxisAlignment.center,
                                //             children: [
                                //               MyText(
                                //                 text: "Variant ${data.variantName}",
                                //                 fontSize: 20,
                                //                 textColor: ColorUtils.black,
                                //                 softSwap: true,
                                //                 overflow: TextOverflow.visible,
                                //                 fontWeight: FontWeight.w500,
                                //               ),
                                //               VerticalSpace(height: 5),
                                //               CustomDividerWidget(),
                                //               VerticalSpace(height: 10),
                                //               ListView.builder(
                                //                 shrinkWrap: true,
                                //                 physics: NeverScrollableScrollPhysics(),
                                //                 padding: EdgeInsets.zero,
                                //                 itemCount: data.variantDetail.length,
                                //                 itemBuilder: (context, variantDetailsIndex) {
                                //                   final variantDetailsData = data.variantDetail[variantDetailsIndex];
                                //                   return Padding(
                                //                     padding: const EdgeInsets.only(bottom: 12),
                                //                     child: variantLargeWidget(
                                //                       label: variantDetailsData.name,
                                //                       price: '\$ ${variantDetailsData.price}',
                                //                       controller: getPCtr,
                                //                     ),
                                //                   );
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         }
                                //
                                //         if (data.variantName == "X-Large") {
                                //           return Column(
                                //             crossAxisAlignment: CrossAxisAlignment.center,
                                //             children: [
                                //               MyText(
                                //                 text: "Variant ${data.variantName}",
                                //                 fontSize: 20,
                                //                 textColor: ColorUtils.black,
                                //                 softSwap: true,
                                //                 overflow: TextOverflow.visible,
                                //                 fontWeight: FontWeight.w500,
                                //               ),
                                //               VerticalSpace(height: 5),
                                //               CustomDividerWidget(),
                                //               VerticalSpace(height: 10),
                                //               ListView.builder(
                                //                 shrinkWrap: true,
                                //                 physics: NeverScrollableScrollPhysics(),
                                //                 padding: EdgeInsets.zero,
                                //                 itemCount: data.variantDetail.length,
                                //                 itemBuilder: (context, variantDetailsIndex) {
                                //                   final variantDetailsData = data.variantDetail[variantDetailsIndex];
                                //                   return Padding(
                                //                     padding: const EdgeInsets.only(bottom: 12),
                                //                     child: variantXLargeWidget(
                                //                       label: variantDetailsData.name,
                                //                       price: variantDetailsData.price,
                                //                     ),
                                //                   );
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         }
                                //
                                //         return const SizedBox.shrink();
                                //       }).toList(),
                                //
                                //       /// 🟢 Variant Options Section (only once)
                                //       Builder(
                                //         builder: (context) {
                                //           final allOptionVariants = getPCtr.variantDataArray
                                //               .where((e) => e.variantName == "Options")
                                //               .expand((e) => e.variantDetail)
                                //               .toList();
                                //
                                //           final seen = <String>{};
                                //           final filteredOptionList = allOptionVariants.where((variant) {
                                //             if (seen.contains(variant.name)) return false;
                                //             seen.add(variant.name);
                                //             return true;
                                //           }).toList();
                                //
                                //           if (getPCtr.variantOptionSelect == null && filteredOptionList.isNotEmpty) {
                                //             WidgetsBinding.instance.addPostFrameCallback((_) {
                                //               if (getPCtr.variantOptionSelect == null) {
                                //                 getPCtr.variantOptionFunction(filteredOptionList.first.name);
                                //               }
                                //             });
                                //           }
                                //
                                //           if (filteredOptionList.isEmpty) return const SizedBox.shrink();
                                //
                                //           return Column(
                                //             crossAxisAlignment: CrossAxisAlignment.center,
                                //             children: [
                                //               MyText(
                                //                 text: "Variant Options",
                                //                 fontSize: 20,
                                //                 textColor: ColorUtils.black,
                                //                 softSwap: true,
                                //                 overflow: TextOverflow.visible,
                                //                 fontWeight: FontWeight.w500,
                                //               ),
                                //               VerticalSpace(height: 5),
                                //               CustomDividerWidget(),
                                //               VerticalSpace(height: 10),
                                //               ListView.builder(
                                //                 shrinkWrap: true,
                                //                 physics: const NeverScrollableScrollPhysics(),
                                //                 padding: EdgeInsets.zero,
                                //                 itemCount: filteredOptionList.length,
                                //                 itemBuilder: (context, index) {
                                //                   final variant = filteredOptionList[index];
                                //                   return Padding(
                                //                     padding: const EdgeInsets.only(bottom: 12),
                                //                     child: variantOptionWidget(label: variant.name),
                                //                   );
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         },
                                //       )
                                //     ],
                                //   ),
                                // ),

                              ///
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: ListView.builder(
                              //     shrinkWrap: true,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     padding: EdgeInsets.zero,
                              //     itemCount: getPCtr.variantDataArray.length,
                              //     itemBuilder: (context, variantDataIndex) {
                              //       final data = getPCtr.variantDataArray[variantDataIndex] ;
                              //       return Column(
                              //         crossAxisAlignment: CrossAxisAlignment.center,
                              //         children: [
                              //           MyText(
                              //             text: "Variant ${data.variantName}",
                              //             fontSize: 20,
                              //             textColor: ColorUtils.black,
                              //             softSwap: true,
                              //             overflow: TextOverflow.visible,
                              //             fontWeight: FontWeight.w500,
                              //           ),
                              //           VerticalSpace(height: 5),
                              //           CustomDividerWidget(),
                              //           VerticalSpace(height: 10),
                              //
                              //
                              //           if (data.variantName == "Large") ...[
                              //             ListView.builder(
                              //               shrinkWrap: true,
                              //               physics: NeverScrollableScrollPhysics(),
                              //               padding: EdgeInsets.zero,
                              //               itemCount: data.variantDetail.length,
                              //               itemBuilder: (context, variantDetailsIndex) {
                              //                 final variantDetailsData = data.variantDetail[variantDetailsIndex];
                              //                 return Padding(
                              //                     padding: const EdgeInsets.only(bottom: 12),
                              //                     child:GestureDetector(
                              //                       onTap: (){
                              //                         getPCtr.variantLargeFunction(variantDetailsData.name, variantDetailsData.price);
                              //                       },
                              //                       child: variantLargeWidget(label: variantDetailsData.name,price: '\$ ${variantDetailsData.price}', controller: getPCtr),
                              //                     )
                              //                 );
                              //               },
                              //             ),
                              //           ] else if (data.variantName == "Options") ...[
                              //             ListView.builder(
                              //               shrinkWrap: true,
                              //               physics: NeverScrollableScrollPhysics(),
                              //               padding: EdgeInsets.zero,
                              //               itemCount: data.variantDetail.length,
                              //               itemBuilder: (context, variantDetailsIndex) {
                              //                 final variantDetailsData = data.variantDetail[variantDetailsIndex];
                              //                 return Padding(
                              //                     padding: const EdgeInsets.only(bottom: 12),
                              //                     child:variantOptionWidget(label:variantDetailsData.name)
                              //                 );
                              //               },
                              //             ),
                              //
                              //           ] else if (data.variantName == "X-Large") ...[
                              //             ListView.builder(
                              //               shrinkWrap: true,
                              //               physics: NeverScrollableScrollPhysics(),
                              //               padding: EdgeInsets.zero,
                              //               itemCount: data.variantDetail.length,
                              //               itemBuilder: (context, variantDetailsIndex) {
                              //                 final variantDetailsData = data.variantDetail[variantDetailsIndex];
                              //                 return Padding(
                              //                     padding: const EdgeInsets.only(bottom: 12),
                              //                     child: variantXLargeWidget(label: variantDetailsData.name, price: variantDetailsData.price)
                              //                 );
                              //               },
                              //             ),
                              //           ]else ...[
                              //             Container()
                              //           ]
                              //
                              //         ],
                              //       );
                              //     },
                              //   ),
                              // ),

                              VerticalSpace(height: 10),
                              if(getPCtr.addonDataArray.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: MyText(
                                      text:'Addons',
                                      fontSize: 20,
                                      textColor: ColorUtils.black,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Center(child: CustomDividerWidget()),
                                  VerticalSpace(height: 10),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: filteredAddonList.length,
                                    itemBuilder: (context, addonsDataIndex) {
                                      final addonData = filteredAddonList[addonsDataIndex];
                                      final isCheck = selectedAddons.contains(addonData.addonsName);
                                      final addPrice = addonData.addonsPrice;

                                      return Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isCheck) {
                                                selectedAddons.remove(addonData.addonsName);
                                                getPCtr.totalAddonPrice -= double.tryParse(addPrice) ?? 0.0;
                                              } else {
                                                selectedAddons.add(addonData.addonsName.toString());
                                                getPCtr.totalAddonPrice += double.tryParse(addPrice) ?? 0.0;
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(right: 15, top: 3, bottom: 3),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(color: ColorUtils.black),
                                            ),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  activeColor: ColorUtils.green,
                                                  value: isCheck,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if (value == true) {
                                                        selectedAddons.add(addonData.addonsName.toString());
                                                        getPCtr.totalAddonPrice += double.tryParse(addPrice) ?? 0.0;
                                                      } else {
                                                        selectedAddons.remove(addonData.addonsName);
                                                        getPCtr.totalAddonPrice -= double.tryParse(addPrice) ?? 0.0;
                                                      }
                                                    });
                                                  },
                                                ),
                                                MyText(
                                                  text: "${addonData.addonsName}",
                                                  fontSize: 16,
                                                  textColor: ColorUtils.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                Spacer(),
                                                MyText(
                                                  text: addonData.addonsPrice,
                                                  fontSize: 16,
                                                  textColor: ColorUtils.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                  ///
                                  // ListView.builder(
                                  //   shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  //   padding: EdgeInsets.zero,
                                  //   itemCount: getPCtr.addonDataArray.length,
                                  //   itemBuilder: (context, addonsDataIndex) {
                                  //     final addonData = getPCtr.addonDataArray[addonsDataIndex];
                                  //     // {addonData.addonsName} {addonData.addonsPrice} 1 se jyda hoga to to mujhe filter kar ke 1 hi display karna hai kaise kar sakte hai
                                  //     final isChecked = selectedAddons.contains(addonData.addonsName);
                                  //     final addPrice = addonData.addonsPrice ;
                                  //     return Padding(
                                  //       padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                  //       child: GestureDetector(
                                  //         onTap: () {
                                  //           setState(() {
                                  //             if (isChecked) {
                                  //               selectedAddons.remove(addonData.addonsName);
                                  //               getPCtr.totalAddonPrice -= double.tryParse(addPrice) ?? 0.0;
                                  //             } else {
                                  //               selectedAddons.add(addonData.addonsName.toString());
                                  //               getPCtr.totalAddonPrice += double.tryParse(addPrice) ?? 0.0;
                                  //             }
                                  //           });
                                  //         },
                                  //         child: Container(
                                  //           padding: const EdgeInsets.only(right: 15,top:3,bottom: 3),
                                  //           width: double.infinity,
                                  //           decoration: BoxDecoration(
                                  //             // color: ColorUtils.black.withOpacity(0.1),
                                  //               borderRadius: BorderRadius.circular(50),
                                  //               border:  Border.all(color: ColorUtils.black)
                                  //
                                  //           ),
                                  //           child: Row(
                                  //             children: [
                                  //               Checkbox(
                                  //                 activeColor: ColorUtils.green,
                                  //                 value: isChecked,
                                  //                 onChanged: (value) {
                                  //                   setState(() {
                                  //                     if (value == true) {
                                  //                       selectedAddons.add(addonData.addonsName.toString());
                                  //                       getPCtr.totalAddonPrice += double.tryParse(addPrice) ?? 0.0;
                                  //                     } else {
                                  //                       selectedAddons.remove(addonData.addonsName);
                                  //                       getPCtr.totalAddonPrice -= double.tryParse(addPrice) ?? 0.0;
                                  //                     }
                                  //                   });
                                  //                 },
                                  //               ),
                                  //
                                  //               MyText(
                                  //                 text: "${addonData.addonsName}" ,
                                  //                 fontSize: 16,
                                  //                 textColor: ColorUtils.black,
                                  //                 fontWeight: FontWeight.w600,
                                  //               ),
                                  //               Spacer(),
                                  //               MyText(
                                  //                 text: addonData.addonsPrice,
                                  //                 fontSize: 16,
                                  //                 textColor: ColorUtils.black,
                                  //                 fontWeight: FontWeight.bold,
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                              VerticalSpace(height: 10),
                              if(getPCtr.containData.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: MyText(
                                        text:'Remove',
                                        fontSize: 20,
                                        textColor: ColorUtils.black,
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Center(child: CustomDividerWidget()),
                                    VerticalSpace(height: 10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: getPCtr.containData.length,
                                      itemBuilder: (context, index) {
                                        final String item = getPCtr.containData[index];
                                        final bool isChecked = selectedAddons.contains(item);

                                        return Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isChecked) {
                                                  selectedAddons.remove(item);
                                                } else {
                                                  selectedAddons.add(item);
                                                }
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(right: 15, top: 3, bottom: 3),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: ColorUtils.black),
                                              ),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    activeColor: ColorUtils.green,
                                                    value: isChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if (value == true) {
                                                          selectedAddons.add(item);
                                                        } else {
                                                          selectedAddons.remove(item);
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  MyText(
                                                    text: item,
                                                    fontSize: 16,
                                                    textColor: ColorUtils.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              VerticalSpace(height: 80),
                            ],
                          )
                        ]
                    )
                )
              ],
            ) ;
          },
        ),
      ),
    );
  }

  Widget variantLargeWidget({
    required GetProductDetailsController controller,
    required String label,
    required String price,
  }) {
    final bool isSelected = controller.variantLargeSelect == label;
    return GestureDetector(
      onTap: () {
        controller.variantLargeFunction(label, price);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtils.green : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: isSelected ? Colors.transparent : ColorUtils.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: label,
              fontSize: 16,
              textColor: isSelected ? ColorUtils.white : ColorUtils.black,
              fontWeight: FontWeight.w500,
            ),
            MyText(
              text: price,
              fontSize: 16,
              textColor: isSelected ? ColorUtils.white : ColorUtils.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget variantOptionWidget({required String label,}) {
    bool isSelected = getProductDetailsController.variantOptionSelect == label;

    return GestureDetector(
      onTap: () {
        getProductDetailsController.variantOptionFunction(label);
        // setState(() {
        //   variantOptionSelect = label;
        // });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        // width: double.infinity,
        decoration: BoxDecoration(
            color: isSelected ? ColorUtils.green : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
        ),
        child: MyText(
          text: label,
          fontSize: 16,
          textColor: isSelected?ColorUtils.white:ColorUtils.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  Widget variantXLargeWidget({required String label,required String price,}) {
    bool isSelected = getProductDetailsController.variantXLargeSelect == label;

    return GestureDetector(
      onTap: () {
        // setState(() {
        //   variantXLargeSelect = label;
        // });
        getProductDetailsController.variantXLargeFunction(label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        // width: double.infinity,
        decoration: BoxDecoration(
            color: isSelected ? ColorUtils.green : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: label,
              fontSize: 16,
              textColor: isSelected?ColorUtils.white:ColorUtils.black,
              fontWeight: FontWeight.w500,
            ),
            MyText(
              text: price,
              fontSize: 16,
              textColor: isSelected?ColorUtils.white:ColorUtils.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }


  // Widget variantLargeWidget({required String label,required String price,}) {
  //
  //   bool isSelected = getProductDetailsController.variantLargeSelect == label;
  //   return GestureDetector(
  //     onTap: () {
  //       getProductDetailsController.variantLargeFunction(label,price);
  //
  //       // setState(() {
  //       //   variantLargeSelect = label;
  //       // });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
  //       // width: double.infinity,
  //       decoration: BoxDecoration(
  //           color: isSelected ? ColorUtils.green : Colors.transparent,
  //           borderRadius: BorderRadius.circular(50),
  //           border:  Border.all(color: isSelected?Colors.transparent:ColorUtils.black)
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           MyText(
  //             text: label,
  //             fontSize: 16,
  //             textColor: isSelected?ColorUtils.white:ColorUtils.black,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           MyText(
  //             text: price,
  //             fontSize: 16,
  //             textColor: isSelected?ColorUtils.white:ColorUtils.black,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


}
