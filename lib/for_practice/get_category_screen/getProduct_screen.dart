import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/controller/getProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'getProductDetailsScreen.dart';
import 'get_category_screen.dart';

class ProductScreen extends StatefulWidget {
  final int catId ;
  const ProductScreen({super.key, required this.catId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GetProductController getProductController = Get.put(GetProductController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductController.getProduct(widget.catId.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetProductController>(
        init: getProductController,
        builder: (getProductCtr) {
          return Container(
            height: screenHeight(context),
            width: screenWidth(context),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.12, -1.0),
                end: Alignment(-1.0, 1.0),
                colors: [
                  Color(0xFF965DE9),
                  Color(0xFF6358EE),
                ],
                stops: [0.108, 0.943],
              ),
            ),
            child: SafeArea(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: getProductCtr.getProductData.length,
                shrinkWrap: true,
                itemBuilder: (context, dflIndex) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => GetProductDetailsScreen(
                        foodId : getProductCtr.getProductData[dflIndex].id.toString()
                      ),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: ColorUtils.black)
                      ),
                      width: screenWidth(context),
                      child: Column(
                        children: [
                          Html(
                            data:getProductCtr.getProductData[dflIndex].desc,
                            shrinkWrap: true,
                            style: {
                              "body": Style(
                                fontSize: FontSize(12.0), // in logical pixels
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
                            title: 'Id',
                            discription:"${getProductCtr.getProductData[dflIndex].id}",
                          ),

                          AllCategoriesText(
                            title: 'Name',
                            discription:getProductCtr.getProductData[dflIndex].name,
                          ),
                          AllCategoriesText(
                            title: 'Price',
                            discription:"\$ ${getProductCtr.getProductData[dflIndex].price}",
                          ),
                          AllCategoriesText(
                            title: 'Discount Price',
                            discription:"\$ ${getProductCtr.getProductData[dflIndex].discountprice}",
                          ),
                          AllCategoriesText(
                            title: 'Sold Out',
                            discription:"${getProductCtr.getProductData[dflIndex].soldOut}",
                          ),
                          AllCategoriesText(
                            title: 'Show App',
                            discription:"${getProductCtr.getProductData[dflIndex].showApp}",
                          ),
                          AllCategoriesText(
                            title: 'Show Pose',
                            discription:"${getProductCtr.getProductData[dflIndex].showPos}",
                          ),
                          AllCategoriesText(
                            title: 'Show QR Code',
                            discription:"${getProductCtr.getProductData[dflIndex].showQrcode}",
                          ),
                          AllCategoriesText(
                            title: 'Make My Own',
                            discription:"${getProductCtr.getProductData[dflIndex].makemyown}",
                          ),
                          AllCategoriesText(
                            title: 'Choose Number Items',
                            discription:"${getProductCtr.getProductData[dflIndex].chooseNumberItems}",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ) ;
        },
      ),
    );
  }
}
