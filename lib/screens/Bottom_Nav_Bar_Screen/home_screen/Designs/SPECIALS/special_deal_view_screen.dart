import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Specials_Deals_Hive_Model/SpecialDealsAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MySnackbar.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialDealViewScreen extends StatefulWidget {
  final String dealName ;
  final String dealAmount ;
  final String dealId;
  // final List<CatDealData> dealData;
  final List<CatSpecialDealData> dealData;
  final String dealDesc ;
  const SpecialDealViewScreen({super.key, required this.dealName, required this.dealAmount, required this.dealData, required this.dealId, required this.dealDesc});

  @override
  State<SpecialDealViewScreen> createState() => _SpecialDealViewScreenState();
}

class _SpecialDealViewScreenState extends State<SpecialDealViewScreen> {
  final List<String> pizzaItems = ['Large Napoletana', 'Large Pepperoni', 'Large Hawaiian', 'Large Aussie'];
  final List<String> pastaItems = ['Fungi',];
  final List<String> alcoholicItems = ['Soft Drink (1.25L)'];

  String? selectedPizzaItem;
  String? selectedPastaItem;
  String? selectedAlcoholicItem;

  // Stores only names
  List<String?> selectedItems = [];
  // Stores full selected food object
  List<CatSpecialDealDataFoodList?> selectedFoodObjects = [];

  String? contains ;
  String? extras ;
  String? image ;

  @override
  void initState() {
    super.initState();
    selectedItems = List<String?>.filled(widget.dealData.length, null);
    selectedFoodObjects = List<CatSpecialDealDataFoodList?>.filled(widget.dealData.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      bottomSheet: Container(
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
          navigateTo: () {
            final box = HiveBoxes.specialDealsAddToCartDB();
            if (selectedItems.contains(null)) {
              MySnackbar.showWarning(context: context, message: 'Please select all food items before adding');
              return;
            }
            // Check if this dealId already exists
            final isAlreadyAdded = box.values.any((element) => element.specialDealId == widget.dealId);

            if (isAlreadyAdded) {
              MySnackbar.showWarning(context: context, message: "You've already added this! Check your cart to update it.");
              return;
            }

            final List<String> dealsCategory = widget.dealData.map((e) => e.category).toList();
            final List<String> dealsNumberOfItem = widget.dealData.map((e) => e.numberOfItem).toList();
            final List<String> variantName = widget.dealData.map((e) => e.variantName).toList();

            final model = SpecialDealsAddToCartDBModel(
              specialDealName: widget.dealName,
              specialDealPrice: widget.dealAmount,
              specialDealCategory: dealsCategory,
              specialDealNumberOfItem: dealsNumberOfItem,
              specialDealSelectedFoodName: selectedItems,
              specialDealId: widget.dealId,
              variantName: variantName,
              specialDealDesc: widget.dealDesc,
              extras: extras,
              images: image,
              contains: contains,
            );

            box.add(model);
            MySnackbar.showSuccess(context: context, message: "Added to cart. You can view it anytime from your cart.");
            Navigator.pop(context);
          },
          buttonName: 'Add To Cart',
        )

      ),

      body: CustomScrollView(
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
                text: '${widget.dealName} - \$${widget.dealAmount}.00',
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            MyText(
                              text: 'SPECIAL DEALS',
                              fontSize: 25,
                              textColor: ColorUtils.white,
                              softSwap: true,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 40,width: 40,)
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.dealData.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = widget.dealData[index];
                        // final List<CatFoodList> foodList = data.foodList;
                        final List<CatSpecialDealDataFoodList> foodList = data.foodList;
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: '${data.numberOfItem} x ${data.variantName} "${data.category}"',
                                fontSize: 18,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w700,
                              ),
                              VerticalSpace(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorUtils.black.withOpacity(0.5),
                                ),
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(12),
                                  dropdownColor: ColorUtils.black,
                                  style: GoogleFonts.roboto(
                                    color: ColorUtils.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  isExpanded: true,
                                  value: selectedItems[index],
                                  hint: MyText(
                                    text: '-Select',
                                    fontSize: 16,
                                    textColor: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down, color: ColorUtils.white),
                                  items: foodList.map((food) {
                                    return DropdownMenuItem<String>(
                                      value: food.name,
                                      child: MyText(
                                        text: food.name,
                                        fontSize: 16,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedItems[index] = value;
                                      final selectedFood = foodList.firstWhere(
                                            (food) => food.name == value,
                                      );
                                      selectedFoodObjects[index] = selectedFood;
                                      extras = selectedFood.extras.toString() ;
                                      image = selectedFood.images.toString() ;
                                      contains = selectedFood.contains.toString();
                                      print('Special deal');
                                      print("Selected Name: ${selectedFood.name}");
                                      print("Extras: ${selectedFood.extras}");
                                      print("Contains: ${selectedFood.contains}");
                                      print("Image: ${selectedFood.images}");
                                    });
                                  },
                                ),
                              ),
                              VerticalSpace(height: 15),
                            ],
                          ),
                        );
                      },
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: widget.dealData.length,
                    //   padding: EdgeInsets.zero,
                    //   itemBuilder: (context, index) {
                    //     final data = widget.dealData[index];
                    //     List<FoodList> foodList  = widget.dealData[index].foodList ;
                    //     return Padding(
                    //       padding: const EdgeInsets.all(12),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           MyText(
                    //             text: '${data.numberOfItem} x \" ${data.category}',
                    //             fontSize: 18,
                    //             textColor: ColorUtils.black,
                    //             fontWeight: FontWeight.w700,
                    //           ),
                    //           VerticalSpace(height: 10),
                    //           Container(
                    //             padding: EdgeInsets.symmetric(horizontal: 20),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               color: ColorUtils.black.withOpacity(0.5),
                    //               // border: Border.all(color: ColorUtils.black.withOpacity(0.3)),
                    //             ),
                    //             child: DropdownButton<String>(
                    //               borderRadius: BorderRadius.circular(12),
                    //               dropdownColor: ColorUtils.black,
                    //               style: GoogleFonts.roboto(
                    //                   color: ColorUtils.white,
                    //                   fontWeight: FontWeight.w500,
                    //                   fontSize: 14
                    //               ),
                    //               isExpanded: true,
                    //               value: selectedPizzaItem,
                    //               hint: MyText(
                    //                 text: '-Select',
                    //                 fontSize: 16,
                    //                 textColor: ColorUtils.white,
                    //                 fontWeight: FontWeight.w400,
                    //               ),
                    //               underline: SizedBox(),
                    //               icon: Icon(Icons.arrow_drop_down,color: ColorUtils.white,),                              items: pizzaItems.map((String value) {
                    //               return DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child:MyText(
                    //                   text: value,
                    //                   fontSize: 16,
                    //                   textColor: ColorUtils.white,
                    //                   fontWeight: FontWeight.w400,
                    //                 ),
                    //               );
                    //             }).toList(),
                    //               onChanged: (value) {
                    //                 setState(() {
                    //                   selectedPizzaItem = value;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //           VerticalSpace(height: 15),
                    //
                    //         ],
                    //       ),
                    //     ) ;
                    //   },
                    // ),

                    // VerticalSpace(height: 15),
                    // MyText(
                    //   text: '1 x \" Traditional Pasta Sauces',
                    //   fontSize: 18,
                    //   textColor: ColorUtils.black,
                    //   fontWeight: FontWeight.w700,
                    // ),
                    // VerticalSpace(height: 10),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: ColorUtils.black.withOpacity(0.5),
                    //     // border: Border.all(color: ColorUtils.black.withOpacity(0.3)),
                    //   ),
                    //   child: DropdownButton<String>(
                    //     borderRadius: BorderRadius.circular(12),
                    //     dropdownColor: ColorUtils.black,
                    //     style: GoogleFonts.roboto(
                    //         color: ColorUtils.white,
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 14
                    //     ),
                    //     isExpanded: true,
                    //     value: selectedPastaItem,
                    //     hint: MyText(
                    //       text: '-Select',
                    //       fontSize: 16,
                    //       textColor: ColorUtils.white,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     underline: SizedBox(),
                    //     icon: Icon(Icons.arrow_drop_down,color: ColorUtils.white,),                              items: pastaItems.map((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child:MyText(
                    //           text: value,
                    //           fontSize: 16,
                    //           textColor: ColorUtils.white,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedPastaItem = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                    // VerticalSpace(height: 15),
                    // MyText(
                    //   text: '1 x \" Non-Alcoholic',
                    //   fontSize: 18,
                    //   textColor: ColorUtils.black,
                    //   fontWeight: FontWeight.w700,
                    // ),
                    // VerticalSpace(height: 10),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: ColorUtils.black.withOpacity(0.5),
                    //     // border: Border.all(color: ColorUtils.black.withOpacity(0.3)),
                    //   ),
                    //   child: DropdownButton<String>(
                    //     borderRadius: BorderRadius.circular(12),
                    //     dropdownColor: ColorUtils.black,
                    //     style: GoogleFonts.roboto(
                    //       color: ColorUtils.white,
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 14
                    //     ),
                    //     isExpanded: true,
                    //     value: selectedAlcoholicItem,
                    //     hint: MyText(
                    //       text: '-Select',
                    //       fontSize: 16,
                    //       textColor: ColorUtils.white,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     underline: SizedBox(),
                    //     icon: Icon(Icons.arrow_drop_down,color: ColorUtils.white,),
                    //     items: alcoholicItems.map((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child:MyText(
                    //           text: value,
                    //           fontSize: 16,
                    //           textColor: ColorUtils.white,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedAlcoholicItem = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ]
              )
          )
        ],
      ),
    );
  }
}
