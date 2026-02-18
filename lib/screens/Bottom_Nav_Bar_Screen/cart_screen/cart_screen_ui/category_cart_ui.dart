import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Add_To_Cart/CategoryAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/category_order_summary_screen.dart';

class CategoryCartUi extends StatefulWidget {
  const CategoryCartUi({super.key});

  @override
  State<CategoryCartUi> createState() => _CategoryCartUiState();
}

class _CategoryCartUiState extends State<CategoryCartUi> {
  final CategoryPriceCartController bqController = Get.put(CategoryPriceCartController());


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.categoryAddToCartDB().listenable(),
      builder: (context, box, _) {
        final items = box.values.toList();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (bqController.categoryQuantities.length != items.length) {
            bqController.categoryInitialize(items.length, items);
          }
        });
        if (items.isEmpty) return Container();

        return Column(
          children: [
            // VerticalSpace(height: 20),
            DividerWidget(),
            VerticalSpace(height: 20),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                final price = double.tryParse(product.productPrice.toString()) ?? 0.0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    // onTap: () {
                    //
                    //   PersistentNavBarNavigator.pushNewScreen(
                    //     context,
                    //     screen: CategoryOrderSummaryDetailsScreen(
                    //       productName: product.productName,
                    //       qty: bqController.categoryQuantities.length > index ? bqController.categoryQuantities[index] : 1,
                    //       productPrice: product.productPrice,
                    //       productTotalPrice: bqController.categoryTotals.length > index ? bqController.categoryTotals[index].toString() : price.toString(),
                    //       id: product.id,
                    //       variantOption: product.variantOptionSelect ?? '',
                    //       productDesc: product.desc,
                    //       grandTotalPrice: double.parse(bqController.categoryTotals[index].toStringAsFixed(2)),
                    //     ),
                    //     withNavBar: false,
                    //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    //   );
                    // },
                    onTap: () async {
                      // Navigate to next screen
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: CategoryOrderSummaryDetailsScreen(
                          addSingleCategoryItemByIndex:index,
                          productName: product.productName,
                          qty: bqController.categoryQuantities[index],
                          productPrice: product.productPrice,
                          productTotalPrice: bqController.categoryTotals[index].toString(),
                          id: product.id,
                          variantOption: product.variantOptionSelectedName ?? '',
                          productDesc: product.desc,
                          grandTotalPrice: double.parse(bqController.categoryTotals[index].toStringAsFixed(2)),
                        ),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },

                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 12,right:12),
                          child: Card(
                            color: ColorUtils.white,
                            surfaceTintColor: ColorUtils.white,
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: product.productName,
                                          fontSize: 16,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        if (product.variantOptionSelectedName != null && product.variantOptionSelectedName!.isNotEmpty)
                                          MyText(
                                            text: product.variantOptionSelectedName!,
                                            fontSize: 14,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        VerticalSpace(height: 10),
                                        Obx(() {
                                          if (index >= bqController.categoryQuantities.length || index >= bqController.categoryTotals.length) return SizedBox();
                                          return MyText(
                                            text: '${bqController.categoryQuantities[index]} × ${product.productPrice} = ${bqController.categoryTotals[index].toStringAsFixed(2)}',
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w600,
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          // onTap: ()async{
                                          //   if(product.id == ){
                                          //
                                          //   }else{
                                          //     await box.deleteAt(index)
                                          //   }
                                          // },
                                          onTap: () async => await box.deleteAt(index),
                                          child: Icon(Icons.delete, color: ColorUtils.red),
                                        ),
                                        VerticalSpace(height: 10),
                                        Obx(() {
                                          if (index >= bqController.categoryQuantities.length) return SizedBox();
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  bqController.categoryDecrement(index, price);
                                                  // update ONLY productCount in Hive
                                                  final box =  HiveBoxes.categoryAddToCartDB();
                                                  // Find existing item by ID
                                                  int? existingItemKey;

                                                  try {
                                                    existingItemKey = box.keys.firstWhere(
                                                          (key) => box.get(key)?.id == product.id,
                                                    );
                                                  } catch (_) {
                                                    existingItemKey = null;
                                                   }

                                                  if (existingItemKey != null) {
                                                    // Update only count
                                                    final existingItem = box.get(existingItemKey);
                                                    existingItem?.updateCount(
                                                      bqController.categoryQuantities[index].toString(),
                                                    );
                                                  } else {
                                                    // Add new product with count
                                                    box.add(CategoryAddToCartDBModel(
                                                      id: product.id,
                                                      productName: product.productName,
                                                      productPrice: product.productPrice,
                                                      productTotalPrice: bqController.categoryTotals[index].toString(),
                                                      variantOptionSelectedName: product.variantOptionSelectedName,
                                                      desc: product.desc,
                                                      productCount: bqController.categoryQuantities[index].toString(),
                                                    ));
                                                  }

                                                },
                                               // onTap: () => bqController.categoryDecrement(index, price),
                                                child: Image.asset('assets/icons/minus_icon.png', height: 25, width: 25),
                                              ),
                                              HorizontalSpace(width: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 2),
                                                child: MyText(
                                                  text: '${bqController.categoryQuantities[index]}',
                                                  fontSize: 16,
                                                  textAlign: TextAlign.center,
                                                  textColor: ColorUtils.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              HorizontalSpace(width: 10),

                                              GestureDetector(
                                                onTap: (){
                                                  bqController.categoryIncrement(index, price);
                                                  // update ONLY productCount in Hive
                                                  final box =  HiveBoxes.categoryAddToCartDB();
                                                  // Find existing item by ID
                                                  int? existingItemKey;

                                                  try {
                                                    existingItemKey = box.keys.firstWhere(
                                                          (key) => box.get(key)?.id == product.id,
                                                    );
                                                  } catch (_) {
                                                    existingItemKey = null;
                                                  }

                                                  if (existingItemKey != null) {
                                                    // Update only count
                                                    final existingItem = box.get(existingItemKey);
                                                    existingItem?.updateCount(
                                                      bqController.categoryQuantities[index].toString(),
                                                    );
                                                  } else {
                                                    // Add new product with count
                                                    box.add(CategoryAddToCartDBModel(
                                                      id: product.id,
                                                      productName: product.productName,
                                                      productPrice: product.productPrice,
                                                      productTotalPrice: bqController.categoryTotals[index].toString(),
                                                      variantOptionSelectedName: product.variantOptionSelectedName,
                                                      desc: product.desc,
                                                      productCount: bqController.categoryQuantities[index].toString(),
                                                    ));
                                                  }
                                                },
                                                child: Image.asset('assets/icons/plus_icon.png', height: 25, width: 25),
                                              ),
                                            ],
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20,top:2,bottom: 2,right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorUtils.backgroundColor
                          ),
                          child: MyText(
                            text: product.productName,
                            fontSize: 14,
                            textColor: ColorUtils.black.withOpacity(0.85),
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}


