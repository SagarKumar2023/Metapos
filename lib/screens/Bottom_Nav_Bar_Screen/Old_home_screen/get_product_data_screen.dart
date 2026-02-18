import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/images.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/getProduct_controller.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class GetProductDataScreen extends StatefulWidget {
  final int catId;
  const GetProductDataScreen({super.key, required this.catId});

  @override
  State<GetProductDataScreen> createState() => _GetProductDataScreenState();
}

class _GetProductDataScreenState extends State<GetProductDataScreen> {
  final GetProductController getProductController = Get.put(GetProductController());

  @override
  void initState() {
    super.initState();
    getProductController.getProduct(widget.catId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetProductController>(
        init: getProductController,
        builder: (getPCtr) {
          if (getPCtr.isLoading) {
            return Center(
              child: MyText(
                text: 'Loading...',
                fontSize: 50,
                textAlign: TextAlign.start,
                textColor: ColorUtils.black.withOpacity(0.7),
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: MyText(
                        text: 'Food List',
                        fontSize: 20,
                        textAlign: TextAlign.start,
                        textColor: ColorUtils.black.withOpacity(0.7),
                        softSwap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    VerticalSpace(height: 10),
                    ...getPCtr.getProductData.map((foodItem) => buildFoodCard(context, foodItem)).toList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, dynamic foodItem) {
    return Container(
      width: screenWidth(context),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtils.red.withOpacity(0.2),
              image: DecorationImage(
                image: AssetImage(ImagesUtils.whatsHot),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenWidth(context),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: ColorUtils.black.withOpacity(0.4),
                  ),
                  child: Html(
                    data: foodItem.desc,
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
                        textAlign: TextAlign.start,
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
          VerticalSpace(height: 5),
          MyText(
            text: foodItem.name,
            fontSize: 12,
            textAlign: TextAlign.center,
            textColor: ColorUtils.black,
            fontWeight: FontWeight.bold,
            softSwap: true,
            overflow: TextOverflow.visible,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Price',
                fontSize: 10,
                textAlign: TextAlign.center,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.bold,
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
              MyText(
                text: "\$ ${foodItem.price}",
                fontSize: 14,
                textAlign: TextAlign.center,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.bold,
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Discount',
                fontSize: 10,
                textAlign: TextAlign.center,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.bold,
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
              MyText(
                text: "\$ ${foodItem.discountprice}",
                fontSize: 10,
                textAlign: TextAlign.center,
                textColor: ColorUtils.black,
                fontWeight: FontWeight.bold,
                softSwap: true,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
