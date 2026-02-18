import 'package:flutter/material.dart';
class DisuseCode extends StatefulWidget {
  const DisuseCode({super.key});

  @override
  State<DisuseCode> createState() => _DisuseCodeState();
}
// final List<String> firstHalfSelectedAddons = [];
// final List<String> firstHalfAddonsData = [
//   'Anchovies \$2.00', 'Avocado \$2.00', 'Bacon \$2.00', 'BBQ Sauce \$2.00', 'Capsicum \$2.00',
//   'cHICKEN \$2.00','Chirozo sausage \$2.00', 'Mozarella \$2.00',
// ];
//
// final List<String> secondHalfAddonsData = [
//   'Anchovies \$2.00', 'Avocado \$2.00', 'Bacon \$2.00', 'BBQ Sauce \$2.00', 'Capsicum \$2.00',
//   'cHICKEN \$2.00','Chirozo sausage \$2.00', 'Mozarella \$2.00',
// ];
//
// final List<String> removeData = [
//   'Bacon', 'Cheese','Egg'
// ];
//
// final List<String> removeSelected = [];
//
// final List<String> secondHalfSelectedAddons = [];

class _DisuseCodeState extends State<DisuseCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   padding: EdgeInsets.zero,
          //   itemCount: widget.foodListData.length,
          //   itemBuilder: (context, foodListIndex) {
          //     final foodListData = widget.foodListData[foodListIndex];
          //     return GestureDetector(
          //       onTap: (){
          //         setState(() {
          //           firstHalfSelect = foodListData.name;
          //         });
          //       },
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          //         // width: double.infinity,
          //         decoration: BoxDecoration(
          //             color: Colors.transparent,
          //             borderRadius: BorderRadius.circular(50),
          //             border:  Border.all(color:ColorUtils.black)
          //         ),
          //         child: MyText(
          //           text: "${foodListData.name}(${widget.variant}  \$${foodListData.price}",
          //           fontSize: 14,
          //           textColor:  ColorUtils.black,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          ///
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     MyText(
          //       text: 'Addons:',
          //       fontSize: 20,
          //       textColor: ColorUtils.black,
          //       fontWeight: FontWeight.w700,
          //     ),
          //     VerticalSpace(height: 10),
          //     ListView.builder(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       padding: EdgeInsets.zero,
          //       itemCount: widget.foodListData.length,
          //       itemBuilder: (context, fIndex) {
          //         return  ListView.builder(
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           padding: EdgeInsets.zero,
          //           itemCount: widget.foodListData[fIndex].addonsDataArray.length,
          //           itemBuilder: (context, aIndex) {
          //             final addOnsData = widget.foodListData[fIndex].addonsDataArray[aIndex];
          //             return GestureDetector(
          //               onTap: (){},
          //               child: Container(
          //                 margin: EdgeInsets.only(bottom: 10),
          //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //                 decoration: BoxDecoration(
          //                   color:ColorUtils.green ,
          //                   borderRadius: BorderRadius.circular(50),
          //                   // border: Border.all(
          //                   //   color:ColorUtils.black,
          //                   // ),
          //                 ),
          //                 child: MyText(
          //                   text: '${addOnsData.addonsName}  \$${addOnsData.addonsPrice}',
          //                   fontSize: 14,
          //                   textColor:  ColorUtils.white,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ) ;
          //           },
          //         );
          //       },
          //     ),
          //   ],
          // ),
          ///
          // if (firstHalfSelect != null)
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       MyText(
          //         text: 'Addons:',
          //         fontSize: 20,
          //         textColor: ColorUtils.black,
          //         fontWeight: FontWeight.w700,
          //       ),
          //       VerticalSpace(height: 15),

          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   padding: EdgeInsets.zero,
          //   itemCount: widget.foodListData.length,
          //   itemBuilder: (context, fIndex) {
          //     final foodListData = widget.foodListData[fIndex];
          //     return  ListView.builder(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       padding: EdgeInsets.zero,
          //       itemCount:widget.foodListData[fIndex].foodListWithDetails.addonsDataArray!.length,
          //       itemBuilder: (context, aDataIndex) {
          //         final addonsData = widget.foodListData[fIndex].foodListWithDetails.addonsDataArray![aDataIndex];
          //         return Padding(
          //             padding: const EdgeInsets.only(bottom: 12),
          //             child: GestureDetector(
          //               onTap: () {
          //                 setState(() {
          //                   // if (isChecked) {
          //                   //   selectedAddons.remove(addonData.addonsName);
          //                   // } else {
          //                   //   selectedAddons.add(addonData.addonsName.toString());
          //                   // }
          //                 });
          //               },
          //               child: Container(
          //                 padding: const EdgeInsets.only(right: 15,top:3,bottom: 3),
          //                 width: double.infinity,
          //                 decoration: BoxDecoration(
          //                   // color: ColorUtils.black.withOpacity(0.1),
          //                     borderRadius: BorderRadius.circular(50),
          //                     border:  Border.all(color: ColorUtils.black)
          //
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     // Checkbox(
          //                     //   activeColor: ColorUtils.green,
          //                     //   value: isChecked,
          //                     //   onChanged: (value) {
          //                     //     setState(() {
          //                     //       if (value == true) {
          //                     //         selectedAddons.add(addonData.addonsName.toString());
          //                     //       } else {
          //                     //         selectedAddons.remove(addonData.addonsName);
          //                     //       }
          //                     //     });
          //                     //   },
          //                     // ),
          //                     MyText(
          //                       text: addonsData.addonsName,
          //                       fontSize: 16,
          //                       textColor: ColorUtils.black,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                     Spacer(),
          //                     MyText(
          //                       text: addonsData.addonsPrice,
          //                       fontSize: 16,
          //                       textColor: ColorUtils.black,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             )
          //           // child: variantLargeWidget(label: variantDetailsData.name,price: '\$ ${variantDetailsData.price}'),
          //         );
          //       },
          //     );
          //   },
          // ),


          // Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: firstHalfAddonsData.map((label) {
          //     final isSelected = firstHalfSelectedAddons.contains(label);
          //     return firstHalfAddonsWidget(
          //       label: label,
          //       isSelected: isSelected,
          //       onTap: () {
          //         setState(() {
          //           isSelected
          //               ? firstHalfSelectedAddons.remove(label)
          //               : firstHalfSelectedAddons.add(label);
          //         });
          //       },
          //     );
          //   }).toList(),
          // ),

          //     VerticalSpace(height: 15),
          //   ],
          // ),
          ///
        ],

      ),
    );
  }
}
