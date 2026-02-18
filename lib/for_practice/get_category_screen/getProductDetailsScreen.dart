import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/controller/getProductDetailsController.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'get_category_screen.dart';

class GetProductDetailsScreen extends StatefulWidget {
  final String? foodId ;
  const GetProductDetailsScreen({super.key, this.foodId});

  @override
  State<GetProductDetailsScreen> createState() => _GetProductDetailsScreenState();
}

class _GetProductDetailsScreenState extends State<GetProductDetailsScreen> {
  GetProductDetailsController getProductDetailsController = Get.put(GetProductDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDetailsController.getProductDetails(widget.foodId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2327),
      body:GetBuilder<GetProductDetailsController>(
        init: getProductDetailsController,
        builder: (GPDC) {
          return Container(
            height: screenHeight(context),
            width: screenWidth(context),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:Color(0xff000000)
              // gradient: LinearGradient(
              //   begin: Alignment(0.12, -1.0),
              //   end: Alignment(-1.0, 1.0),
              //   colors: [
              //     Color(0xFF965DE9),
              //     Color(0xFF6358EE),
              //   ],
              //   stops: [0.108, 0.943],
              // ),
            ),
            child: GPDC.isLoading ?  Center(
              child: MyText(
                text: 'Loading...',
                fontSize: 50,
                // textAlign: TextAlign.start,
                textColor: ColorUtils.white,
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
            ): SafeArea(
                child: SingleChildScrollView(
                  child:Column(
                    children: [
                      Html(
                        data:GPDC.productDetailData!.desc,
                        shrinkWrap: true,
                        style: {
                          "body": Style(
                            fontSize: FontSize(12.0),
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                          "p": Style(
                              fontSize: FontSize(10.0),
                              color: ColorUtils.white,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center
                          ),
                          "strong": Style(
                            fontWeight: FontWeight.w700,
                          ),
                          "em": Style(
                            fontStyle: FontStyle.italic,
                          ),
                        },
                      ),
                      AllCategoriesText(
                        title: 'Name',
                        discription:GPDC.productDetailData!.name,
                      ),
                      AllCategoriesText(
                        title: 'Price',
                        discription:GPDC.productDetailData!.price,
                      ),
                      AllCategoriesText(
                        title: 'Discount Price',
                        discription:GPDC.productDetailData!.discountprice,
                      ),
                      AllCategoriesText(
                        title: 'contains',
                        discription:GPDC.productDetailData!.contains,
                      ),
                      AllCategoriesText(
                        title: 'type',
                        discription:GPDC.productDetailData!.type,
                      ),
                      AllCategoriesText(
                        title: 'catName',
                        discription:GPDC.productDetailData!.catName,
                      ),
                      AllCategoriesText(
                        title: 'prodQty',
                        discription:"${GPDC.productDetailData!.prodQty}",
                      ),
                      AllCategoriesText(
                        title: 'soldOut',
                        discription:"${GPDC.productDetailData!.soldOut}",
                      ),
                      AllCategoriesText(
                        title: 'isTakeAway',
                        discription:"${GPDC.productDetailData!.isTakeAway}",
                      ),
                      AllCategoriesText(
                        title: 'Make My Own',
                        discription:"${GPDC.productDetailData!.makemyown}",
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: GPDC.productDetailData!.addonsDataArray!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, addonDataIndex) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: ColorUtils.white)
                            ),
                            child: Column(
                              children: [
                                AllCategoriesText(
                                  title: 'Id',
                                  discription:"${GPDC.productDetailData!.addonsDataArray![addonDataIndex].addonsId}",
                                ),
                                AllCategoriesText(
                                  title: 'Name',
                                  discription:GPDC.productDetailData!.addonsDataArray![addonDataIndex].addonsName,
                                ),
                                AllCategoriesText(
                                  title: 'Price',
                                  discription:GPDC.productDetailData!.addonsDataArray![addonDataIndex].addonsPrice,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      MyText(
                        text: 'Variant data Array',
                        fontSize: 18,
                        // textAlign: TextAlign.start,
                        textColor: ColorUtils.white,
                        softSwap: true,
                        overflow: TextOverflow.visible,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: GPDC.productDetailData!.variantDataArray!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, variantDataIndex) {
                          return Column(
                            children: [
                              AllCategoriesText(
                                title: 'Variant Name',
                                discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantName,
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail.length,
                                shrinkWrap: true,
                                itemBuilder: (context, variantDetailindex) {
                                  return  Container(
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
                                            IconButton(
                                                onPressed: () async {
                                                  final variant = GPDC.productDetailData!
                                                      .variantDataArray![variantDataIndex]
                                                      .variantDetail[variantDetailindex];

                                                  var box = HiveBoxes.productCartBox();

                                                  final isAlreadyAdded = box.values.any((item) =>
                                                  item.id == variant.id && item.name == variant.name && item.price == variant.price);

                                                  if (isAlreadyAdded) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: MyText(
                                                          text: 'Item already added',
                                                          textColor: ColorUtils.white,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    await box.add(variant);
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: MyText(
                                                          text: 'Item added to cart',
                                                          textColor: ColorUtils.white,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },

                                             icon: Icon(Icons.shopping_cart),color: ColorUtils.white),
                                            GestureDetector(
                                              onTap: (){
                                                // Navigator.push(context,MaterialPageRoute(builder: (context) =>HiveCartScreen(),));
                                              },
                                              child: MyText(
                                                text: 'Cart Screen',
                                                fontSize: 18,
                                                // textAlign: TextAlign.start,
                                                textColor: ColorUtils.white,
                                                softSwap: true,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ],
                                        ),
                                        AllCategoriesText(
                                          title: 'Name',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].name,
                                        ),
                                        AllCategoriesText(
                                          title:'Price',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].price,
                                        ),
                                        AllCategoriesText(
                                          title: 'Discount Price',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].dprice,
                                        ),
                                        AllCategoriesText(
                                          title: 'Variant Type',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].variantType,
                                        ),
                                        AllCategoriesText(
                                          title:'Created At',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].createdAt,
                                        ),
                                        AllCategoriesText(
                                          title: 'Updated At',
                                          discription:GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].updatedAt,
                                        ),
                                        AllCategoriesText(
                                          title: 'Product Quantity',
                                          discription:"${GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].prodQty}",
                                        ),
                                        AllCategoriesText(
                                          title:'Id',
                                          discription:"${GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].id}",
                                        ),
                                        AllCategoriesText(
                                          title: 'Food',
                                          discription:"${GPDC.productDetailData!.variantDataArray![variantDataIndex].variantDetail[variantDetailindex].food}",
                                        ),
                                      ],
                                    ),
                                  ) ;
                                },
                              )
                            ],
                          );
                        },
                      )
                    ],
                  )
                )
            ),
          ) ;
        },
      ),
    );
  }
}
