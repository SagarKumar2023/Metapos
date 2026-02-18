import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/ALCOHOLIC/beer_lager_design.dart';

class DataAndCategory extends StatefulWidget {
  const DataAndCategory({super.key});

  @override
  State<DataAndCategory> createState() => _DataAndCategoryState();
}

class _DataAndCategoryState extends State<DataAndCategory> {
  CategoryController categoryController = Get.put(CategoryController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.getAllCategoryData();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return  BeerLagerDesign(
          productHeading: 'Beer - Lager',
          productName: 'VB Can',
          productDesc: 'Bottle',
          productPrice: '\$ 33.00',
          productImage: 'assets/images/food.png',
        );
      },
    );
  }
}
