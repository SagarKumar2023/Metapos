import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/get_category_screen/get_category_screen.dart';
import 'package:metapos_sync_order_online_ofline/model/get_product_details_model/getProductDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';


class HiveCartScreen extends StatefulWidget {
  const HiveCartScreen({super.key});

  @override
  State<HiveCartScreen> createState() => _HiveCartScreenState();
}

class _HiveCartScreenState extends State<HiveCartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2327),
      appBar: AppBar(
        surfaceTintColor: ColorUtils.white,
        backgroundColor: ColorUtils.white,
        centerTitle: true,
        title:MyText(
          text: 'Cart',
          fontSize: 16,
          // textAlign: TextAlign.start,
          textColor: ColorUtils.black,
          softSwap: true,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.visible,
        ),
      ),
      body: Container(
        height: screenHeight(context),
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(12),
        width: screenWidth(context),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
         color: Color(0xff000000)
        ),
        child: ValueListenableBuilder(
            valueListenable: HiveBoxes.productCartBox().listenable(),
            builder: (context, box, child) {
              return ListView.builder(
                itemCount: box.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = box.values.toList();
                  return data.isEmpty ? Center(
                    child:  MyText(
                      text: 'Cart Empty',
                      fontSize: 50,
                      // textAlign: TextAlign.start,
                      textColor: ColorUtils.white,
                      softSwap: true,
                      overflow: TextOverflow.visible,
                    )
                  ):Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: ColorUtils.white)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              final box = HiveBoxes.productCartBox();
                              box.deleteAt(index);
                            }, icon: Icon(Icons.delete),color: ColorUtils.red,),
                            GestureDetector(

                              onTap: () async {
                                var pCartBox = HiveBoxes.productCartBox();
                                var pOrderBox = HiveBoxes.productOrderBox();
                                var item = data[index];

                                final copiedItem = GetFoodListVariantDetail(
                                  name: item.name,
                                  price: item.price,
                                  dprice: item.dprice,
                                  variantType: item.variantType,
                                  createdAt: item.createdAt,
                                  updatedAt: item.updatedAt,
                                  prodQty: item.prodQty,
                                  id: item.id,
                                  food: item.food,
                                  imageid: item.imageid,
                                );

                                await pOrderBox.add(copiedItem);

                                await pCartBox.deleteAt(index);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: MyText(text: 'Order placed!', textColor: ColorUtils.white)),
                                );
                              },
                              // onTap: ()async{
                              //   var pCartBox = HiveBoxes.productCartBox();
                              //   var pOrderBox = HiveBoxes.productOrderBox();
                              //   var item = data[index];
                              //   await pOrderBox.add(item);
                              //   await pCartBox.deleteAt(index);
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: MyText(text: 'Order placed!', textColor: ColorUtils.white)),
                              //   );
                              // },
                            child: MyText(
                                text: 'Place Order',
                                fontSize: 14,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.white,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) =>HiveOrderScreen(),));
                              },
                              child: MyText(
                                text: 'Place screen',
                                fontSize: 14,
                                // textAlign: TextAlign.start,
                                textColor: ColorUtils.white,
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                            )
                          ],
                        ),
                        AllCategoriesText(
                          title: 'Name',
                          discription:"${data[index].name}",
                        ),
                        AllCategoriesText(
                          title:'Price',
                          discription:data[index].price,
                        ),
                        AllCategoriesText(
                          title: 'Discount Price',
                          discription:data[index].dprice,
                        ),
                        AllCategoriesText(
                          title: 'Variant Type',
                          discription:data[index].variantType,
                        ),
                        AllCategoriesText(
                          title:'Created At',
                          discription:data[index].createdAt,
                        ),
                        AllCategoriesText(
                          title: 'Updated At',
                          discription:data[index].updatedAt,
                        ),
                        AllCategoriesText(
                          title: 'Product Quantity',
                          discription:data[index].prodQty.toString(),
                        ),
                        AllCategoriesText(
                          title:'Id',
                          discription:data[index].id.toString(),
                        ),
                        AllCategoriesText(
                          title: 'Food',
                          discription:data[index].food.toString(),
                        ),
                      ],
                    ),
                  );
                },
              ) ;
            },
        ),
      ),
    );
  }
}
