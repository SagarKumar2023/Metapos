import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/images.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Add_To_Cart/HalfAndHalfAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/HALF_AND_HALF/Half_N_Half_Price_Controller.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MySnackbar.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HalfNHalfViewScreen extends StatefulWidget {
  final String pName;
  // final List<CatFoodList> foodListData ;
  final List<CatHalfNHalfFoodList> foodListData ;
  final String variant ;
  final String productId ;
  final String productDesc ;
  const HalfNHalfViewScreen({super.key, required this.pName, required this.variant, required this.foodListData, required this.productId, required this.productDesc,});

  @override
  State<HalfNHalfViewScreen> createState() => _HalfNHalfViewScreenState();
}

class _HalfNHalfViewScreenState extends State<HalfNHalfViewScreen> {



  CategoryController categoryController = Get.put(CategoryController());
  // final Set<AddonsDataArray> firstHalfSelectedAddons = {};
  // final Set<AddonsDataArray> secondHalfSelectedAddons = {};
  // List<String> firstHalfSelectedAddons  = [] ;
  List<CatAddonsDataArray> firstHalfSelectedAddons = [];
  List<CatAddonsDataArray> secondHalfSelectedAddons  = [] ;

  String? catName ;
  String? type ;
  String? catId ;
  String? contains;
  String? image;
  String? firstHalfSelectedNameId;
  String? secondHalfSelectedNameId ;

  late int firstHalfAddonAvailable = firstHalfSelectedAddons.length;
  String? firstHalfSelect ;
  String? firstHalfSelectedId ;
  String? firstHalfSelectedName ;
  String? firstHalfSelectedVariant ;
  String? firstHalfSelectedPrice ;

  late int secondHalfAddonAvailable = secondHalfSelectedAddons.length;
  String? secondHalfSelect ;
  String? secondHalfSelectedName ;
  String? secondHalfSelectedId ;
  String? secondHalfSelectedVariant ;
  String? secondHalfSelectedPrice ;
  final Set<String> firstHalfSelectedRemoveItems = {};
  final Set<String> secondHalfSelectedRemoveItems = {};
  HalfNHalfPriceController priceController = Get.put(HalfNHalfPriceController());


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
        child: Obx(() => MyButton(
          buttonColor: Colors.red,
          navigateTo: () {
            final box = HiveBoxes.halfAndHalfAddToCartDB();

            if (firstHalfSelect == null || secondHalfSelect == null || firstHalfSelectedName == null
                || secondHalfSelectedName == null || firstHalfSelectedVariant == null
                || secondHalfSelectedVariant == null || firstHalfSelectedPrice == null ||
                secondHalfSelectedPrice == null) {
              MySnackbar.showWarning(context: context, message: 'Please complete all selections');
              return;
            }

            final model = HalfAndHalfAddToCartDBModel(
                catId:catId,
                catName: catName,
                type: type,
                contains: contains,
                image: image,
                firstHalfSelectedAddons: firstHalfSelectedAddons,
                secondHalfSelectedAddons: secondHalfSelectedAddons,
                firstHalfSelectedAddonsAvailable: firstHalfAddonAvailable.toString(),
                secondHalfSelectedAddonsAvailable: secondHalfAddonAvailable.toString(),
                firstHalfSelect: firstHalfSelect,
                firstHalfSelectedName: firstHalfSelectedName,
                firstHalfSelectedNameId: firstHalfSelectedNameId,
                firstHalfSelectedVariant: firstHalfSelectedVariant,
                firstHalfSelectedPrice: firstHalfSelectedPrice,
                secondHalfSelect: secondHalfSelect,
                secondHalfSelectedName: secondHalfSelectedName,
                secondHalfSelectedNameId: secondHalfSelectedNameId,
                secondHalfSelectedVariant: secondHalfSelectedVariant,
                secondHalfSelectedPrice: secondHalfSelectedPrice,
                firstHalfSelectedRemoveItems: firstHalfSelectedRemoveItems.toList(),
                secondHalfSelectedRemoveItems: secondHalfSelectedRemoveItems.toList(),
                productName: widget.pName,
                totalPrice:  priceController.totalPrice.toStringAsFixed(2),
                productId: widget.productId,
                productDesc: widget.productDesc
            );
            box.add(model);
            MySnackbar.showSuccess(context: context, message: "Added to cart. You can view it anytime from your cart.");
            Navigator.pop(context);
          },
          buttonName: 'Add To Cart \$${priceController.totalPrice.toStringAsFixed(2)}',
        ),),
      ),
      body: GetBuilder<CategoryController>(
        init: categoryController,
        builder: (catCtr) {
          return CustomScrollView(
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
                    text: widget.pName,
                    fontSize: 20,
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
                                // Container(
                                //   height: 30,
                                //   width: 30,
                                //   decoration: BoxDecoration(
                                //       color: ColorUtils.white,
                                //       borderRadius: BorderRadius.circular(4),
                                //       image: DecorationImage(image: AssetImage('assets/icons/veg.png'),fit: BoxFit.fill)
                                //   ),
                                // ),
                              ],
                            ),
                            Spacer(),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     MyText(
                            //       text: 'Traditional(Large)',
                            //       fontSize: 35,
                            //       textColor: ColorUtils.white,
                            //       softSwap: true,
                            //       overflow: TextOverflow.visible,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ],
                            // )
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
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'First Half',
                                fontSize: 20,
                                textColor: ColorUtils.black,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: 'Please choose 1 item from the list below',
                                fontSize: 14,
                                textColor: ColorUtils.black.withOpacity(0.8),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w400,
                              ),
                              VerticalSpace(height: 15),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(widget.foodListData.length, (index) {
                                  final foodListData = widget.foodListData[index];
                                  final isSelected = firstHalfSelect == foodListData.name;
                                  return reusableWidget(
                                    label: "${foodListData.name} (${widget.variant})  \$${foodListData.price}",
                                    borderColor: isSelected ? ColorUtils.green: ColorUtils.black,
                                    cntnrColor: isSelected ? ColorUtils.green : Colors.white,
                                    txtColor: isSelected ? ColorUtils.white : ColorUtils.black,
                                    onTap: () {
                                      setState(() {
                                        catId = foodListData.catId.toString() ;
                                        catName = foodListData.catName ;
                                        type = foodListData.type ;
                                        image = foodListData.imagePath ;
                                        contains = foodListData.contains ;
                                        contains = foodListData.contains ;
                                        firstHalfSelect = foodListData.name;
                                        firstHalfSelectedId = foodListData.id.toString();
                                        firstHalfSelectedName = foodListData.name;
                                        firstHalfSelectedNameId = foodListData.id.toString();
                                        firstHalfSelectedVariant = widget.variant ;
                                        firstHalfSelectedPrice = foodListData.price.toString() ;
                                        priceController.setFirstHalfBasePrice(double.parse(foodListData.price.toString()));
                                        // print( "----->${foodListData.name}  ${foodListData.price}") ;
                                      });
                                    },
                                  );
                                }),
                              ),
                              VerticalSpace(height: 10),
                              if (firstHalfSelect != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Addons:',
                                      fontSize: 20,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    VerticalSpace(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: () {
                                        final shownAddons = <String>{};

                                        List<Widget> widgets = [];
                                        for (var foodItem in widget.foodListData) {
                                          for (var addOn in foodItem.addonsDataArray) {
                                            final addonName = addOn.addonsName.toString();
                                            // if this addon name is already added, skip it
                                            if (shownAddons.contains(addonName)) continue;
                                            shownAddons.add(addonName);
                                            widgets.add(
                                              reusableWidget(
                                                onTap: () {
                                                  setState(() {
                                                    final addonData = CatAddonsDataArray(
                                                      addonsId: addOn.addonsId,
                                                      addonsName: addOn.addonsName,
                                                      addonsPrice: addOn.addonsPrice,
                                                    );

                                                    // Check if selected
                                                    final alreadySelected = firstHalfSelectedAddons.any(
                                                          (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                    );

                                                    if (alreadySelected) {
                                                      firstHalfSelectedAddons.removeWhere(
                                                            (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                      );
                                                    } else {
                                                      firstHalfSelectedAddons.add(addonData);
                                                    }
                                                  });

                                                  priceController.toggleFirstHalfAddon(
                                                    double.parse(addOn.addonsPrice.toString()),
                                                  );
                                                },

                                                label: '$addonName  \$${addOn.addonsPrice}',

                                                borderColor: firstHalfSelectedAddons.any((item) => item.addonsId.toString() == addOn.addonsId.toString(),)
                                                    ? ColorUtils.green
                                                    : Colors.black.withOpacity(0.5),

                                                cntnrColor: firstHalfSelectedAddons.any(
                                                      (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                )
                                                    ? ColorUtils.green
                                                    : Colors.white,

                                                txtColor: firstHalfSelectedAddons.any(
                                                      (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                )
                                                    ? ColorUtils.white
                                                    : ColorUtils.black,
                                              ),
                                            );
                                          }
                                        }

                                        return widgets;
                                      }(),
                                    ),
                                    VerticalSpace(height: 10),
                                    MyText(
                                      text: 'Remove:',
                                      fontSize: 20,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    VerticalSpace(height: 15),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        for (int findex = 0; findex < widget.foodListData.length; findex++)
                                          for (int cindex = 0; cindex < widget.foodListData[findex].containsData!.length; cindex++)
                                            Builder(builder: (context) {
                                              final String item = widget.foodListData[findex].containsData![cindex];
                                              final bool isSelected = secondHalfSelectedRemoveItems.contains(item);
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isSelected) {
                                                      secondHalfSelectedRemoveItems.remove(item);
                                                    } else {
                                                      secondHalfSelectedRemoveItems.add(item);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: isSelected ? Colors.red.withOpacity(0.8) : Colors.white,
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color:isSelected ?Colors.transparent: ColorUtils.black.withOpacity(0.5)),
                                                  ),
                                                  child: MyText(
                                                    text: item,
                                                    fontSize: 14,
                                                    textColor: isSelected ? Colors.white : ColorUtils.black,
                                                    fontWeight: FontWeight.w500,
                                                    textDecoration: isSelected ? TextDecoration.lineThrough : TextDecoration.none,
                                                    decorationColor: ColorUtils.white,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              VerticalSpace(height: 15),

                              MyText(
                                text: 'Second Half',
                                fontSize: 20,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w700,
                              ),
                              MyText(
                                text: 'Please choose 1 item from the list below',
                                fontSize: 14,
                                textColor: ColorUtils.black.withOpacity(0.8),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w400,
                              ),
                              VerticalSpace(height: 15),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(widget.foodListData.length, (index) {
                                  final foodListData = widget.foodListData[index];
                                  final isSelected = secondHalfSelect == foodListData.name;
                                  return reusableWidget(
                                    label: "${foodListData.name} (${widget.variant})  \$${foodListData.price}",
                                    borderColor: isSelected ? ColorUtils.green: ColorUtils.black,
                                    cntnrColor: isSelected ? ColorUtils.green : Colors.white,
                                    txtColor: isSelected ? ColorUtils.white : ColorUtils.black,
                                    onTap: () {
                                      setState(() {
                                        catId = foodListData.catId.toString() ;
                                        catName = foodListData.catName ;
                                        type = foodListData.type ;
                                        image = foodListData.imagePath ;
                                        contains = foodListData.contains ;
                                        secondHalfSelect = foodListData.name;
                                        secondHalfSelectedId = foodListData.id.toString();
                                        secondHalfSelectedName = foodListData.name ;
                                        secondHalfSelectedNameId = foodListData.id.toString() ;
                                        secondHalfSelectedVariant = widget.variant;
                                        secondHalfSelectedPrice = foodListData.price.toString() ;
                                      });
                                      priceController.setSecondHalfBasePrice(double.parse(foodListData.price.toString()));
                                    },
                                  );
                                }),
                              ),
                              VerticalSpace(height: 10),
                              if (secondHalfSelect != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Addons:',
                                      fontSize: 20,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    VerticalSpace(height: 10),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: () {
                                        final shownAddons = <String>{};

                                        List<Widget> widgets = [];

                                        for (var foodItem in widget.foodListData) {
                                          for (var addOn in foodItem.addonsDataArray) {
                                            final addonName = addOn.addonsName.toString();
                                            // if this addon name is already added, skip it
                                            if (shownAddons.contains(addonName)) continue;
                                            shownAddons.add(addonName); // mark as shown

                                            widgets.add(
                                              reusableWidget(
                                                onTap: () {
                                                  setState(() {
                                                    final addonData = CatAddonsDataArray(
                                                      addonsId: addOn.addonsId,
                                                      addonsName: addOn.addonsName,
                                                      addonsPrice: addOn.addonsPrice,
                                                    );

                                                    // Check if already selected
                                                    final alreadySelected = secondHalfSelectedAddons.any(
                                                          (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                    );

                                                    if (alreadySelected) {
                                                      secondHalfSelectedAddons.removeWhere(
                                                            (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                      );
                                                    } else {
                                                      secondHalfSelectedAddons.add(addonData);
                                                    }
                                                  });

                                                  priceController.toggleSecondHalfAddon(double.parse(addOn.addonsPrice.toString()),);

                                                },
                                                label: '$addonName  \$${addOn.addonsPrice}',
                                                borderColor: secondHalfSelectedAddons.any(
                                                      (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                )? ColorUtils.green : Colors.black.withOpacity(0.5),
                                                cntnrColor: secondHalfSelectedAddons.any(
                                                      (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                )? ColorUtils.green: Colors.white,
                                                txtColor: secondHalfSelectedAddons.any(
                                                      (item) => item.addonsId.toString() == addOn.addonsId.toString(),
                                                )? ColorUtils.white : ColorUtils.black,
                                              ),
                                            );
                                          }
                                        }

                                        return widgets;
                                      }(),
                                    ),
                                    VerticalSpace(height: 10),
                                    MyText(
                                      text: 'Remove:',
                                      fontSize: 20,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    VerticalSpace(height: 15),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        for (int findex = 0; findex < widget.foodListData.length; findex++)
                                          for (int cindex = 0; cindex < widget.foodListData[findex].containsData!.length; cindex++)
                                            Builder(builder: (context) {
                                              final String item = widget.foodListData[findex].containsData![cindex];
                                              final bool isSelected = firstHalfSelectedRemoveItems.contains(item);

                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isSelected) {
                                                      firstHalfSelectedRemoveItems.remove(item);
                                                    } else {
                                                      firstHalfSelectedRemoveItems.add(item);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: isSelected ? Colors.red.withOpacity(0.8) : Colors.white,
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color:isSelected ?Colors.transparent: ColorUtils.black.withOpacity(0.5)),
                                                  ),
                                                  child: MyText(
                                                    text: item,
                                                    fontSize: 14,
                                                    textColor: isSelected ? Colors.white : ColorUtils.black,
                                                    fontWeight: FontWeight.w500,
                                                    textDecoration: isSelected ? TextDecoration.lineThrough : TextDecoration.none,
                                                    decorationColor: ColorUtils.white,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ],
                                ),

                              VerticalSpace(height: 80),
                            ],
                          ),
                        )
                      ]
                  )
              )
            ],
          ) ;
        },
      ),
    );
  }

  Widget reusableWidget({required String label, required Color borderColor, required Color cntnrColor, required Color txtColor ,required VoidCallback onTap,}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: cntnrColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color:borderColor),
        ),
        child: MyText(
          text: label,
          fontSize: 14,
          textColor: txtColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    ) ;
  }

}
