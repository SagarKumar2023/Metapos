import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Deals_Hive_Model/Deals_Add_To_Cart/DealsAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/deals_order_summary_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/deals_price_conroller.dart';

class DealCartUi extends StatefulWidget {
  const DealCartUi({super.key});

  @override
  State<DealCartUi> createState() => _DealCartUiState();
}

class _DealCartUiState extends State<DealCartUi> {
  final DealsPriceCartController dealsPriceCtr = Get.put(DealsPriceCartController());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.dealsAddToCartDB().listenable(),
      builder: (context, box, _) {
        final modelItems = box.values.toList();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (dealsPriceCtr.dealsQuantities.length != modelItems.length) {
            dealsPriceCtr.dealsInitialize(modelItems.length, modelItems);
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
                final perItemPrice = double.tryParse(data.dealPrice ?? '0') ?? 0.0;

                return Obx(() {
                  if (index >= dealsPriceCtr.dealsQuantities.length) return SizedBox();

                  final qty = dealsPriceCtr.dealsQuantities[index];
                  final total = qty * perItemPrice;
                  return GestureDetector(
                    onTap: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: DealsOrderSummaryScreen(
                            dealName:data.dealName.toString(),
                            dealPrice:data.dealPrice.toString(),
                            dealTotalPrice:total.toString(),
                            dealFoodName:data.dealSelectedFoodName,
                            dealCategory: data.dealsCategory,
                            dealQty: dealsPriceCtr.dealsQuantities.length > index ? dealsPriceCtr.dealsQuantities[index] : 1,
                            dealNoOfItem: data.dealsNumberOfItem,
                            dealId: data.dealId.toString(),
                          dealDesc : data.dealDesc.toString()

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
                                  // color: Color(0xffE6E6FA)
                                  // color: ColorUtils.redAccent.withOpacity(0.2)
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
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(data.dealSelectedFoodName.length, (index) {
                                              final noOfItem = data.dealsNumberOfItem[index];
                                              final food = data.dealSelectedFoodName[index];
                                              final category = data.dealsCategory[index];
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  VerticalSpace(height: 5),
                                                  MyText(
                                                    text: "$noOfItem x $category",
                                                    fontSize: 16,
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
                                          VerticalSpace(height: 3),
                                          MyText(
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
                                                    dealsPriceCtr.dealsDecrement(index, perItemPrice);                                                    // update ONLY productCount in Hive
                                                    final box = HiveBoxes.dealsAddToCartDB();
                                                    // Find existing item by ID
                                                    int? existingItemKey;

                                                    try {
                                                      existingItemKey = box.keys.firstWhere(
                                                            (key) => box.get(key)?.dealId == data.dealId,
                                                      );
                                                    } catch (_) {
                                                      existingItemKey = null;
                                                    }

                                                    if (existingItemKey != null) {
                                                      // Update only count
                                                      final existingItem = box.get(existingItemKey);
                                                      existingItem?.updateCount(
                                                        dealsPriceCtr.dealsQuantities[index].toString(),
                                                      );
                                                    } else {
                                                      // Add new product with count
                                                      box.add(DealsAddToCartDBModel(
                                                        productCount: dealsPriceCtr.dealsQuantities[index].toString(),
                                                        dealName: data.dealName,
                                                        dealPrice: data.dealName,
                                                        dealsCategory: data.dealsCategory,
                                                        dealsNumberOfItem:data.dealsNumberOfItem,
                                                        dealSelectedFoodName: data.dealSelectedFoodName,
                                                        dealId:data.dealId,
                                                        dealDesc: data.dealDesc,

                                                      ));
                                                    }
                                                  },
                                                  //onTap: () => dealsPriceCtr.dealsDecrement(index, perItemPrice),
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
                                                  onTap: (){
                                                    dealsPriceCtr.dealsIncrement(index, perItemPrice);                                                    // update ONLY productCount in Hive
                                                    final box = HiveBoxes.dealsAddToCartDB();
                                                    // Find existing item by ID
                                                    int? existingItemKey;

                                                    try {
                                                      existingItemKey = box.keys.firstWhere(
                                                            (key) => box.get(key)?.dealId == data.dealId,
                                                      );
                                                    } catch (_) {
                                                      existingItemKey = null;
                                                    }

                                                    if (existingItemKey != null) {
                                                      // Update only count
                                                      final existingItem = box.get(existingItemKey);
                                                      existingItem?.updateCount(
                                                        dealsPriceCtr.dealsQuantities[index].toString(),
                                                      );
                                                    } else {
                                                      // Add new product with count
                                                      box.add(DealsAddToCartDBModel(
                                                        productCount: dealsPriceCtr.dealsQuantities[index].toString(),
                                                        dealName: data.dealName,
                                                        dealPrice: data.dealName,
                                                        dealsCategory: data.dealsCategory,
                                                        dealsNumberOfItem:data.dealsNumberOfItem,
                                                        dealSelectedFoodName: data.dealSelectedFoodName,
                                                        dealId:data.dealId,
                                                        dealDesc: data.dealDesc,
                                                      ));
                                                    }
                                                  },
                                                  //onTap: () => dealsPriceCtr.dealsIncrement(index, perItemPrice),
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
                              // color: Color(0xffE0FFFF)
                            ),
                            child: MyText(
                              text: data.dealName,
                              fontSize: 15,
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
            )
          ],
        );
      },
    );
  }
}
