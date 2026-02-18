import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/halfnhalf_order_summary_screen.dart';


class HalfNHalfCartUi extends StatefulWidget {
  const HalfNHalfCartUi({super.key});

  @override
  State<HalfNHalfCartUi> createState() => _HalfNHalfCartUiState();
}

class _HalfNHalfCartUiState extends State<HalfNHalfCartUi> {
  final HalfNHalfPriceCartController halfNHalfController = Get.put(HalfNHalfPriceCartController());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.halfAndHalfAddToCartDB().listenable(),
      builder: (context, box, _) {
        final halfAndHalfAddToCartHiveBoxList = box.values.toList().cast<HalfAndHalfAddToCartDBModel>();
        /// Avoid duplicate initialization
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (halfNHalfController.halfNHalfQuantities.length != halfAndHalfAddToCartHiveBoxList.length) {
            halfNHalfController.halfNHalfInitialize(halfAndHalfAddToCartHiveBoxList.length, halfAndHalfAddToCartHiveBoxList);
          }
        });

        if (halfAndHalfAddToCartHiveBoxList.isEmpty) return Container();

        return Column(
          children: [
            VerticalSpace(height: 20),
            DividerWidget(),
            VerticalSpace(height: 20),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: halfAndHalfAddToCartHiveBoxList.length,
              itemBuilder: (context, index) {
                final product = halfAndHalfAddToCartHiveBoxList[index];
                final unitPrice = double.tryParse(product.totalPrice.toString()) ?? 0.0;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Obx(() {
                    if (index >= halfNHalfController.halfNHalfQuantities.length) return SizedBox();
                    final qty = halfNHalfController.halfNHalfQuantities[index];
                    final total = qty * unitPrice;
                    return GestureDetector(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(
                          context, screen: HalfNHalfOrderSummaryScreen(
                            addSingleHalfItemByIndex:index,
                            firstHalfAddonData:product.firstHalfSelectedAddons,
                            secondHalfAddonData:product.secondHalfSelectedAddons,
                            firstHalfRemoveData:product.firstHalfSelectedRemoveItems,
                            secondHalfRemoveData:product.secondHalfSelectedRemoveItems,
                            productName: product.productName,
                            qty: qty,
                            // qty: halfNHalfController.halfNHalfQuantities.length > index ? halfNHalfController.halfNHalfQuantities[index] : 1,
                            productPrice: product.totalPrice,
                            productTotalPrice: total.toStringAsFixed(2),
                            id: product.productId.toString(),
                            productDesc : product.productDesc,
                            grandTotalPrice: double.parse(halfNHalfController.halfNHalfItemTotals[index].toStringAsFixed(2)),
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
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// Product Details
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: product.productName,
                                                fontSize: 16,
                                                textColor: ColorUtils.black,
                                                softSwap: true,
                                                overflow: TextOverflow.visible,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              MyText(
                                                text: '$qty × ${unitPrice.toStringAsFixed(2)} = ${total.toStringAsFixed(2)}',
                                                textColor: ColorUtils.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                        ),

                                        /// Actions (Delete, Qty)
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                      onTap: () {
                                                        halfNHalfController.halfNHalfDecrement(index, unitPrice);

                                                        final box = HiveBoxes.halfAndHalfAddToCartDB();
                                                        final item = box.getAt(index);

                                                        if (item != null) {
                                                          item.productCount = halfNHalfController.halfNHalfQuantities[index].toString();
                                                          item.totalPrice = unitPrice.toString() ;
                                                          item.gtpOfQtyInToProductPrice = halfNHalfController.halfNHalfItemTotals[index].toStringAsFixed(2);
                                                          item.save();
                                                        }
                                                      },
                                                      // onTap: (){
                                                      //   halfNHalfController.halfNHalfDecrement(index, unitPrice);
                                                      //   // update ONLY productCount in Hive
                                                      //   final box = HiveBoxes.halfAndHalfAddToCartHiveBox();
                                                      //   // Find existing item by ID
                                                      //   int? existingItemKey;
                                                      //
                                                      //   try {
                                                      //     existingItemKey = box.keys.firstWhere(
                                                      //           (key) => box.get(key)?.productId == product.productId,
                                                      //     );
                                                      //   } catch (_) {
                                                      //     existingItemKey = null;
                                                      //   }
                                                      //
                                                      //   if (existingItemKey != null) {
                                                      //     // Update only count
                                                      //     final existingItem = box.get(existingItemKey);
                                                      //     existingItem?.updateCount(
                                                      //       halfNHalfController.halfNHalfQuantities[index].toString(),
                                                      //     );
                                                      //   } else {
                                                      //     // Add new product with count
                                                      //     box.add(HalfAndHalfAddToCartHiveBoxModel(
                                                      //       productCount: halfNHalfController.halfNHalfQuantities[index].toString(),
                                                      //       firstHalfSelectedAddons: product.firstHalfSelectedAddons,
                                                      //       secondHalfSelectedAddons:product.secondHalfSelectedAddons,
                                                      //       firstHalfSelectedRemoveItems: product.firstHalfSelectedRemoveItems,
                                                      //       secondHalfSelectedRemoveItems:product.secondHalfSelectedRemoveItems,
                                                      //       productName: product.productName,
                                                      //       totalPrice: product.totalPrice,
                                                      //       productId: product.productId,
                                                      //       productDesc: product.productDesc,
                                                      //     ));
                                                      //   }
                                                      // },
                                                      //onTap: () => halfNHalfController.halfNHalfDecrement(index, unitPrice),
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
                                                        text: '$qty',
                                                        fontSize: 16,
                                                        textAlign: TextAlign.center,
                                                        textColor: ColorUtils.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    HorizontalSpace(width: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        halfNHalfController.halfNHalfIncrement(index, unitPrice);

                                                        final box = HiveBoxes.halfAndHalfAddToCartDB();
                                                        final item = box.getAt(index);

                                                        if (item != null) {
                                                          item.productCount = halfNHalfController.halfNHalfQuantities[index].toString();
                                                          item.totalPrice = unitPrice.toString() ;
                                                          item.gtpOfQtyInToProductPrice = halfNHalfController.halfNHalfItemTotals[index].toStringAsFixed(2);
                                                          item.save();
                                                        }
                                                      },

                                                      // onTap: (){
                                                      //   halfNHalfController.halfNHalfIncrement(index, unitPrice);
                                                      //   // update ONLY productCount in Hive
                                                      //   final box = HiveBoxes.halfAndHalfAddToCartHiveBox();
                                                      //   // Find existing item by ID
                                                      //   int? existingItemKey;
                                                      //
                                                      //   try {
                                                      //     existingItemKey = box.keys.firstWhere(
                                                      //           (key) => box.get(key)?.productId == product.productId,
                                                      //     );
                                                      //   } catch (_) {
                                                      //     existingItemKey = null;
                                                      //   }
                                                      //
                                                      //   if (existingItemKey != null) {
                                                      //     // Update only count
                                                      //     final existingItem = box.get(existingItemKey);
                                                      //     existingItem?.updateCount(
                                                      //       halfNHalfController.halfNHalfQuantities[index].toString(),
                                                      //     );
                                                      //   } else {
                                                      //     // Add new product with count
                                                      //     box.add(HalfAndHalfAddToCartHiveBoxModel(
                                                      //       productCount: halfNHalfController.halfNHalfQuantities[index].toString(),
                                                      //       firstHalfSelectedAddons: product.firstHalfSelectedAddons,
                                                      //       secondHalfSelectedAddons:product.secondHalfSelectedAddons,
                                                      //       firstHalfSelectedRemoveItems: product.firstHalfSelectedRemoveItems,
                                                      //       secondHalfSelectedRemoveItems:product.secondHalfSelectedRemoveItems,
                                                      //       productName: product.productName,
                                                      //       totalPrice: product.totalPrice,
                                                      //       productId: product.productId,
                                                      //       productDesc: product.productDesc,
                                                      //     ));
                                                      //   }
                                                      // },
                                                      // onTap: () => halfNHalfController.halfNHalfIncrement(index, unitPrice),
                                                      child: Image.asset(
                                                        'assets/icons/plus_icon.png',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    /// First Half Info
                                    MyText(
                                      text: 'First Half (${product.firstHalfSelectedName})',
                                      fontSize: 16,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    VerticalSpace(height: 8),

                                    /// First Half Addons
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Added: ",
                                          fontSize: 14,
                                          textColor: ColorUtils.green,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        HorizontalSpace(width: 5),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 4,
                                            runSpacing: 3,
                                            children: [
                                              for (var addon in product.firstHalfSelectedAddons)
                                                MyText(
                                                  text: "${addon.addonsName},",
                                                  fontSize: 14,
                                                  textColor: ColorUtils.green,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Remove:",
                                          fontSize: 14,
                                          textColor: ColorUtils.redAccent,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        HorizontalSpace(width: 5),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 2,
                                            runSpacing: 2,
                                            children: [
                                              for (var item in product.firstHalfSelectedRemoveItems)
                                                MyText(
                                                  text: "$item,",
                                                  fontSize: 14,
                                                  textColor: ColorUtils.redAccent,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    VerticalSpace(height: 5),

                                    /// Second Half Info
                                    MyText(
                                      text: 'Second Half (${product.secondHalfSelectedName})',
                                      fontSize: 16,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    VerticalSpace(height: 5),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Added: ",
                                          fontSize: 14,
                                          textColor: ColorUtils.green,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        HorizontalSpace(width: 5),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 4,
                                            runSpacing: 3,
                                            children: [
                                              for (var item in product.secondHalfSelectedAddons)
                                                MyText(
                                                  text: "${item.addonsName},",
                                                  fontSize: 14,
                                                  textColor: ColorUtils.green,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Remove:",
                                          fontSize: 14,
                                          textColor: ColorUtils.redAccent,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        HorizontalSpace(width: 5),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 2,
                                            runSpacing: 2,
                                            children: [
                                              for (var item in product.secondHalfSelectedRemoveItems)
                                                MyText(
                                                  text: "$item,",
                                                  fontSize: 14,
                                                  textColor: ColorUtils.redAccent,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                              text: 'Half And Half',
                              fontSize: 16,
                              textColor: ColorUtils.black.withOpacity(0.85),
                              softSwap: true,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                );
              },
            )
          ],
        );
      },
    );
  }
}
