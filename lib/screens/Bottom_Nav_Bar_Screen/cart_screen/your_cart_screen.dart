import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class YourCartScreen extends StatefulWidget {
  const YourCartScreen({super.key});

  @override
  State<YourCartScreen> createState() => _YourCartScreenState();
}

class _YourCartScreenState extends State<YourCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: ColorUtils.white,
        backgroundColor: ColorUtils.white,
        title: MyText(
          text: 'Your Cart',
          fontSize: 25,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.black,
          softSwap: true,
          overflow: TextOverflow.visible,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText(
                  text: 'Total',
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  textColor: ColorUtils.black,
                  fontWeight: FontWeight.w700,
                ),
                MyText(
                  text: 'Qty',
                  fontSize: 16,
                  textAlign: TextAlign.start,
                  textColor: ColorUtils.black,
                  fontWeight: FontWeight.w700,
                ),
                MyText(
                  text: 'Total',
                  fontSize: 16,
                  textAlign: TextAlign.start,
                  textColor: ColorUtils.black,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            VerticalSpace(height: 10),
            DividerWidget(),
            VerticalSpace(height: 10),
            ValueListenableBuilder(
              valueListenable:HiveBoxes.categoryAddToCartDB().listenable() ,
              builder: (context, box, child) {
                final item  = box.values.toList();
                if (item.isEmpty) {
                  return Center(child: Text("No data stored yet."));
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: item.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final productItems = item[index];
                    return Column(
                      children: [
                        VerticalSpace(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: MyText(
                                text: productItems.productName,
                                fontSize: 16,
                                textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:  MyText(
                                text: '1 * \$${productItems.productPrice}',
                                fontSize: 14,
                                textAlign: TextAlign.start,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:Row(
                                children: [
                                  MyText(
                                    text: "\$${productItems.productTotalPrice}",
                                    fontSize: 16,
                                    textAlign: TextAlign.start,
                                    textColor: ColorUtils.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Spacer(),
                                  // HorizontalSpace(width: 10),
                                  InkWell(
                                      onTap: ()async{
                                        final box = HiveBoxes.categoryAddToCartDB() ;
                                        await box.deleteAt(index);
                                      },
                                      child: Icon(Icons.delete,color: ColorUtils.red,)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        VerticalSpace(height: 10),
                        DividerWidget(height: 1.5,),
                      ],
                    );
                  },
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}


