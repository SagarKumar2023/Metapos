
//
// class OldHomeScreen extends StatefulWidget {
//   const OldHomeScreen({super.key});
//
//   @override
//   State<OldHomeScreen> createState() => _OldHomeScreenState();
// }
//
// class _OldHomeScreenState extends State<OldHomeScreen> {
//   final CategoryController categoryController = Get.put(CategoryController());
//   TextEditingController searchCtr = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     categoryController.getAllCategoryData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.white,
//       body: GetBuilder<CategoryController>(
//         init: categoryController,
//         builder: (catCtr) {
//           if (catCtr.isLoading) {
//             return Center(
//               child: MyText(
//                 text: 'Loading...',
//                 fontSize: 50,
//                 textAlign: TextAlign.start,
//                 textColor: ColorUtils.black.withOpacity(0.7),
//                 softSwap: true,
//                 overflow: TextOverflow.visible,
//               ),
//             );
//           }
//
//           return SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(onPressed: (){}, icon:Icon(Icons.location_on_outlined,size: 35,color:  ColorUtils.black.withOpacity(0.6),)),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MyText(
//                             text: 'Home',
//                             fontSize: 17,
//                             textAlign: TextAlign.center,
//                             textColor: ColorUtils.black.withOpacity(0.7),
//                             softSwap: true,
//                             overflow: TextOverflow.visible,
//                           ),
//                           ScrollingTextWidget(
//                             text: 'B 8, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309',
//                             textColor:  ColorUtils.black.withOpacity(0.7),
//                             fontWeight: FontWeight.w300,
//                             fontSize: 14,
//                           )
//                         ],
//                       ),
//                       Spacer(),
//                      Image(image: AssetImage('assets/images/food_logo.png'),height: 45,)
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8,right: 8),
//                     child: MyTextField(
//                       // suffixIcon:Icon(Icons.,size: 25,),
//                       focusedBorderColor: Colors.transparent,
//                       preFixIcon:Icon(Icons.search,size: 25,),
//                       controller: searchCtr,
//                       borderRadius: 10,
//                       hintText: "Search for food groceries or more...",
//                       keyboardType: TextInputType.name,
//                       fillColor: ColorUtils.blue.withOpacity(0.1),
//                       enabledBorderColor: Colors.transparent,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12,right: 12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         VerticalSpace(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             MyText(
//                               text: 'Top Categories',
//                               fontSize: 18,
//                               textAlign: TextAlign.start,
//                               textColor: ColorUtils.black.withOpacity(0.7),
//                               softSwap: true,
//                               overflow: TextOverflow.visible,
//                             ),
//                             GestureDetector(
//                               onTap: (){
//                                 Navigator.push(context,MaterialPageRoute(builder: (context) => FoodListScreen(),));
//                               },
//                               child: MyText(
//                                 text: 'Foods',
//                                 fontSize: 18,
//                                 textAlign: TextAlign.start,
//                                 textColor:  Color(0xff49A332),
//                                 softSwap: true,
//                                 overflow: TextOverflow.visible,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         VerticalSpace(height: 10),
//                         SizedBox(
//                           height: 400,
//                           child: ListView.builder(
//                             scrollDirection: Axis.vertical,
//                             itemCount: catCtr.comboDataList.expand((combo) => combo.categoryList).length,
//                             itemBuilder: (context, index) {
//                               // Flatten all food items
//                               final allFoodCategoryItems = catCtr.comboDataList.expand((combo) => combo.categoryList).toList();
//                               final categoryItem = allFoodCategoryItems[index];
//                               return SizedBox(
//                                 width: screenWidth(context) ,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Card(
//                                       elevation: 0,
//                                       surfaceTintColor: Color(0xff49A332),
//                                       color: Color(0xff49A332),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10)
//                                       ),
//                                       child: Container(
//                                         // height: 150,
//                                         width: screenWidth(context),
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                         child: Row(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Expanded(
//                                               flex: 1,
//                                               child: Container(
//                                                 margin: EdgeInsets.all(3),
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     color: ColorUtils.white
//                                                 ),
//                                                 child: Center(
//                                                   child: Image(image: AssetImage('assets/images/food.png'),),
//                                                 ),
//                                               ),
//                                             ),
//                                             // HorizontalSpace(width: 10),
//                                             Expanded(
//                                               flex: 2,
//                                               child: Column(
//                                                 crossAxisAlignment:CrossAxisAlignment.start,
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 children: [
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left: 8,right: 8),
//                                                     child: MyText(
//                                                       text: categoryItem.name,
//                                                       fontSize: 18,
//                                                       textAlign: TextAlign.start,
//                                                       textColor: ColorUtils.white,
//                                                       fontWeight: FontWeight.w500,
//                                                       softSwap: true,
//                                                       overflow: TextOverflow.visible,
//                                                     ),
//                                                   ),
//                                                   Html(
//                                                     data:categoryItem.desc,
//                                                     shrinkWrap: true,
//                                                     style: {
//                                                       "body": Style(
//                                                         fontSize: FontSize(12.0), // in logical pixels
//                                                         color: Colors.white,
//                                                         fontWeight: FontWeight.w400,
//                                                       ),
//                                                       "p": Style(
//                                                           fontSize: FontSize(12.0),
//                                                           color: ColorUtils.white,
//                                                           fontWeight: FontWeight.w400,
//                                                           textAlign: TextAlign.start
//                                                       ),
//                                                       "strong": Style(
//                                                         fontWeight: FontWeight.w700,
//                                                       ),
//                                                       "em": Style(
//                                                         fontStyle: FontStyle.italic,
//                                                       ),
//                                                     },
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left: 8,right: 8),
//                                                     child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         MyText(
//                                                           text: 'Type',
//                                                           fontSize: 14,
//                                                           textAlign: TextAlign.center,
//                                                           textColor: ColorUtils.white,
//                                                           fontWeight: FontWeight.w500,
//                                                           softSwap: true,
//                                                           overflow: TextOverflow.visible,
//                                                         ),
//                                                         MyText(
//                                                           text: categoryItem.type,
//                                                           fontSize: 14,
//                                                           textAlign: TextAlign.center,
//                                                           textColor: ColorUtils.white,
//                                                           fontWeight: FontWeight.w500,
//                                                           softSwap: true,
//                                                           overflow: TextOverflow.visible,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ) ;
//                             },
//                           ),
//                         ),
//                         VerticalSpace(height: 10),
//                         MyText(
//                           text: 'Special Deal',
//                           fontSize: 20,
//                           textAlign: TextAlign.start,
//                           textColor: ColorUtils.black.withOpacity(0.7),
//                           softSwap: true,
//                           overflow: TextOverflow.visible,
//                         ),
//                         VerticalSpace(height: 10),
//                         SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: catCtr.specialDealDataList.length,
//                             itemBuilder: (context, specialDealIndex) {
//                               return Container(
//                                 width: screenWidth(context) * 0.75,
//                                 margin: const EdgeInsets.only(right: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 150,
//                                       width: screenWidth(context)*0.75,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         image: DecorationImage(
//                                           image: AssetImage(ImagesUtils.topRestaurant),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: 150,
//                                         width: screenWidth(context)*0.75,
//                                         padding: EdgeInsets.only(bottom: 8,top: 8),
//
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               Colors.white.withOpacity(0.05), // Top color
//                                               Colors.black.withOpacity(0.4),
//                                               Colors.black, // Bottom color
//                                             ],
//                                           ),
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8,right: 10),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     padding: EdgeInsets.only(left: 13,right: 13,bottom:2,top: 2),
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xff49A332),
//                                                       borderRadius: BorderRadius.circular(150)
//                                                     ),
//                                                     child: MyText(
//                                                       text: catCtr.specialDealDataList[specialDealIndex].name,
//                                                       fontSize: 18,
//                                                       textAlign: TextAlign.start,
//                                                       textColor: ColorUtils.white,
//                                                       fontWeight: FontWeight.w500,
//                                                       softSwap: true,
//                                                       overflow: TextOverflow.visible,
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     padding: EdgeInsets.only(left: 13,right: 13,bottom:2,top: 2),
//                                                     decoration: BoxDecoration(
//                                                         color: Color(0xff49A332),
//                                                         borderRadius: BorderRadius.circular(150)
//                                                     ),
//                                                     child: MyText(
//                                                       text: "\$ ${catCtr.specialDealDataList[specialDealIndex].amount}",
//                                                       fontSize: 18,
//                                                       textAlign: TextAlign.center,
//                                                       textColor: ColorUtils.white,
//                                                       fontWeight: FontWeight.w500,
//                                                       softSwap: true,
//                                                       overflow: TextOverflow.visible,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Spacer(),
//                                             Html(
//                                               data:catCtr.specialDealDataList[specialDealIndex].desc,
//                                               shrinkWrap: true,
//                                               style: {
//                                                 "body": Style(
//                                                   fontSize: FontSize(10.0), // in logical pixels
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w400,
//                                                 ),
//                                                 "p": Style(
//                                                     fontSize: FontSize(10.0),
//                                                     color: ColorUtils.white,
//                                                     fontWeight: FontWeight.bold,
//                                                     textAlign: TextAlign.start
//                                                 ),
//                                                 "strong": Style(
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 "em": Style(
//                                                   fontStyle: FontStyle.italic,
//                                                 ),
//                                               },
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8,right: 10),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   MyText(
//                                                     text: 'Start Date',
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.start,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                   MyText(
//                                                     text: "${catCtr.specialDealDataList[specialDealIndex].startDate}",
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.center,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8,right: 10),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   MyText(
//                                                     text: 'End Time',
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.start,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                   MyText(
//                                                     text: "${catCtr.specialDealDataList[specialDealIndex].endTime}",
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.center,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         VerticalSpace(height: 10),
//                         MyText(
//                           text: 'Deal Data',
//                           fontSize: 20,
//                           textAlign: TextAlign.start,
//                           textColor: ColorUtils.black.withOpacity(0.7),
//                           softSwap: true,
//                           overflow: TextOverflow.visible,
//                         ),
//                         SizedBox(
//                           height: 242,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: catCtr.specialDealDataList.expand((specialDeal) => specialDeal.dealData).length,
//                             itemBuilder: (context, dealDataIndex) {
//                               final dealDataItems = catCtr.specialDealDataList.expand((combo) => combo.dealData).toList();
//                               final dealItem = dealDataItems[dealDataIndex];
//                               return Container(
//                                 width: screenWidth(context) * 0.75,
//                                 margin: const EdgeInsets.only(right: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 150,
//                                       width: screenWidth(context)*0.75,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         image: DecorationImage(
//                                           image: AssetImage(ImagesUtils.topRestaurant),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: 150,
//                                         width: screenWidth(context)*0.75,
//                                         padding: EdgeInsets.only(bottom: 8,top: 8),
//
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               Colors.white.withOpacity(0.05), // Top color
//                                               Colors.black.withOpacity(0.4),
//                                               Colors.black, // Bottom color
//                                             ],
//                                           ),
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8,right: 10),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     padding: EdgeInsets.only(left: 13,right: 13,bottom:2,top: 2),
//                                                     decoration: BoxDecoration(
//                                                         color: Color(0xff49A332),
//                                                         borderRadius: BorderRadius.circular(150)
//                                                     ),
//                                                     child: MyText(
//                                                       text: dealItem.category,
//                                                       fontSize: 18,
//                                                       textAlign: TextAlign.start,
//                                                       textColor: ColorUtils.white,
//                                                       fontWeight: FontWeight.w500,
//                                                       softSwap: true,
//                                                       overflow: TextOverflow.visible,
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     padding: EdgeInsets.only(left: 13,right: 13,bottom:2,top: 2),
//                                                     decoration: BoxDecoration(
//                                                         color: Color(0xff49A332),
//                                                         borderRadius: BorderRadius.circular(150)
//                                                     ),
//                                                     child: MyText(
//                                                       text: dealItem.variantName,
//                                                       fontSize: 18,
//                                                       textAlign: TextAlign.center,
//                                                       textColor: ColorUtils.white,
//                                                       fontWeight: FontWeight.w500,
//                                                       softSwap: true,
//                                                       overflow: TextOverflow.visible,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Spacer(),
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8,right: 10),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   MyText(
//                                                     text: 'No Of Item',
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.start,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                   MyText(
//                                                     text: dealItem.numberOfItem,
//                                                     fontSize: 14,
//                                                     textAlign: TextAlign.center,
//                                                     textColor: ColorUtils.white,
//                                                     fontWeight: FontWeight.w500,
//                                                     softSwap: true,
//                                                     overflow: TextOverflow.visible,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ) ;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
