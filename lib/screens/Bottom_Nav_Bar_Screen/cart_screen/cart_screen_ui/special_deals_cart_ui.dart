import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Specials_Deals_Hive_Model/SpecialDealsAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/special_deals_price_conroller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/specials_deals_order_summary_screen.dart';

class SpecialDealsCartUi extends StatefulWidget {
  const SpecialDealsCartUi({super.key});

  @override
  State<SpecialDealsCartUi> createState() => _SpecialDealsCartUiState();
}

class _SpecialDealsCartUiState extends State<SpecialDealsCartUi> {
  final SpecialDealsPriceCartController specialDealsPriceCtr = Get.put(SpecialDealsPriceCartController());

  late final List<CatDealData> dealData;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.specialDealsAddToCartDB().listenable(),
      builder: (context, box, _) {
        final modelItems = box.values.toList();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (specialDealsPriceCtr.specialDealsQuantities.length != modelItems.length) {
            specialDealsPriceCtr.specialDealsInitialize(modelItems.length, modelItems);
          }
        });

        if (modelItems.isEmpty) return Container();

        return Column(
          children: [
            VerticalSpace(height: 20),
            DividerWidget(),
            VerticalSpace(height: 20),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: modelItems.length,
              itemBuilder: (context, index) {
                final data = modelItems[index];
                final perItemPrice = double.tryParse(data.specialDealPrice ?? '0') ?? 0.0;

                return Obx(() {
                  if (index >= specialDealsPriceCtr.specialDealsQuantities.length ||
                      index >= specialDealsPriceCtr.specialDealsTotals.length) {
                    return SizedBox();
                  }

                  final qty = specialDealsPriceCtr.specialDealsQuantities[index];
                  final total = qty * perItemPrice;
                  return GestureDetector(
                    onTap: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: SpecialDealsOrderSummaryScreen(
                            dealName:data.specialDealName.toString(),
                            dealPrice:data.specialDealPrice.toString(),
                            dealTotalPrice:total.toString(),
                            dealFoodName:data.specialDealSelectedFoodName,
                            dealCategory: data.specialDealCategory,
                            dealQty: specialDealsPriceCtr.specialDealsQuantities.length > index ? specialDealsPriceCtr.specialDealsQuantities[index] : 1,
                            dealNoOfItem: data.specialDealNumberOfItem,
                            dealId: data.specialDealId.toString(),
                          dealDesc : data.specialDealDesc
                        ),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15,left: 12,right:12),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: ColorUtils.white
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(top: 15,left: 12,right: 12,bottom: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: screenWidth(context),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(data.variantName.length, (index) {
                                              final variant = data.variantName[index];
                                              final count = data.specialDealNumberOfItem[index];
                                              final food = data.specialDealSelectedFoodName[index];
                                              final category = data.specialDealCategory[index];
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  VerticalSpace(height: 5),
                                                  MyText(
                                                    text: "$count x $variant $category",
                                                    fontSize: 14,
                                                    textColor: ColorUtils.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  VerticalSpace(height: 3),
                                                  MyText(
                                                    text: food,
                                                    fontSize: 14,
                                                    textColor: ColorUtils.black.withOpacity(0.85),
                                                    softSwap: true,
                                                    overflow: TextOverflow.visible,
                                                    fontWeight: FontWeight.bold,
                                                  ),

                                                ],
                                              );
                                            }),
                                          ),
                                          MyText(
                                            // text: '1 × ${data.specialDealPrice} = 100',
                                            text: '$qty × ${perItemPrice.toStringAsFixed(2)} = ${total.toStringAsFixed(2)}',
                                            fontSize: 14,
                                            textColor: ColorUtils.black.withOpacity(0.85),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () => box.deleteAt(index),
                                              child: Icon(Icons.delete, color: ColorUtils.red),
                                            ),
                                            VerticalSpace(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    specialDealsPriceCtr.specialDealsDecrement(index, perItemPrice);                                                    // update ONLY productCount in Hive
                                                    final List<String> variantName = dealData.map((e) => e.variantName).toList();

                                                    final box = HiveBoxes.specialDealsAddToCartDB();
                                                    // Find existing item by ID
                                                    int? existingItemKey;

                                                    try {
                                                      existingItemKey = box.keys.firstWhere(
                                                            (key) => box.get(key)?.specialDealId == data.specialDealId,
                                                      );
                                                    } catch (_) {
                                                      existingItemKey = null;
                                                    }

                                                    if (existingItemKey != null) {
                                                      // Update only count
                                                      final existingItem = box.get(existingItemKey);
                                                      existingItem?.updateCount(
                                                        specialDealsPriceCtr.specialDealsQuantities[index].toString(),
                                                      );
                                                    } else {
                                                      // Add new product with count
                                                      box.add(SpecialDealsAddToCartDBModel(
                                                          specialDealName: data.specialDealName,
                                                          specialDealPrice:  data.specialDealPrice,
                                                          specialDealCategory:  data.specialDealCategory,
                                                          specialDealNumberOfItem:  data.specialDealNumberOfItem,
                                                          specialDealSelectedFoodName:  data.specialDealSelectedFoodName,
                                                          specialDealId:  data.specialDealId,
                                                          variantName:  variantName,
                                                          specialDealDesc: data.specialDealDesc
                                                      ));
                                                    }
                                                  },
                                                  // onTap: () => specialDealsPriceCtr.specialDealsDecrement(index, perItemPrice),
                                                  child: Image.asset(
                                                    'assets/icons/minus_icon.png',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                                HorizontalSpace(width: 10),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 2),
                                                  child: MyText(
                                                    text: "$qty",
                                                    fontSize: 16,
                                                    textAlign: TextAlign.center,
                                                    textColor: ColorUtils.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                HorizontalSpace(width: 10),
                                                GestureDetector(
                                                  onTap: () => specialDealsPriceCtr.specialDealsIncrement(index, perItemPrice),
                                                  child: Image.asset(
                                                    'assets/icons/plus_icon.png',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                ),
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
                              text: data.specialDealName,
                              fontSize: 16,
                              textColor: ColorUtils.black.withOpacity(0.85),
                              softSwap: true,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ) ;
                },);
              },
            ),
            VerticalSpace(height: 20),
            DividerWidget(),
            VerticalSpace(height: 20),
          ],
        );
      },
    );
  }
}
