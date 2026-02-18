import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/images.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/favourite_screen/getProductDataScreenTwo.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  CategoryController catCtrr = Get.put(CategoryController());
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.microtask(() {
      catCtrr.getAllCategoryData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CategoryController>(
          init: catCtrr,
          builder: (catctrr){
            if (catctrr.isLoading) {
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
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: catctrr.comboDataList.expand((combo) => combo.foodList).length,
              itemBuilder: (context, index) {
                final allFoodItems = catctrr.comboDataList.expand((combo) => combo.foodList).toList();
                final foodItem = allFoodItems[index];
                var foodItemPrice = foodItem.price ;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: screenHeight(context),
                      width: screenWidth(context),
                      color: Color(0xff49A332),

                      // color: Color(0xff000080),
                      child: SafeArea(
                        child: Column(
                          children: [
                            VerticalSpace(height: 4),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: (){
                                  if (_currentPage < catCtrr.comboDataList.expand((combo) => combo.foodList).length - 1) {
                                    _currentPage++;
                                    _pageController.animateToPage(
                                      _currentPage,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.only(left: 2),
                                  margin: EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios,color: ColorUtils.white,),
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                // color: ColorUtils.white.withOpacity(0.2),
                              ),
                              child: Image(
                                image: AssetImage('assets/images/food.png'),
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight(context) * 0.57,
                      width: screenWidth(context),
                      // padding: EdgeInsets.only(left: 20, top: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        color: ColorUtils.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 20,right: 20),                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff49A332),
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        MyText(
                                          text: '★',
                                          fontSize: 14,
                                          textAlign: TextAlign.start,
                                          textColor: ColorUtils.white,
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                        MyText(
                                          text: ' 4.9',
                                          fontSize: 14,
                                          textAlign: TextAlign.start,
                                          textColor: ColorUtils.white,
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '\$ ${foodItem.price}',
                                // '\$ ${_counter * foodItemPrice}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils.black.withOpacity(0.7),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          ),
                          VerticalSpace(height: 12),
                          Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: foodItem.name,
                                    fontSize:20,
                                    textAlign: TextAlign.start,
                                    textColor: ColorUtils.black.withOpacity(0.9),
                                    softSwap: true,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12,right: 20),                          child: Html(
                            data:foodItem.desc,
                            shrinkWrap: true,
                            style: {
                              "body": Style(
                                  fontSize: FontSize(14.0), // in logical pixels
                                  color: ColorUtils.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.playfair().fontFamily
                              ),
                              "p": Style(
                                  fontSize: FontSize(14.0),
                                  color: ColorUtils.black,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.start,
                                  fontFamily: GoogleFonts.playfair().fontFamily
                              ),
                              "strong": Style(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: GoogleFonts.playfair().fontFamily
                              ),
                              "em": Style(
                                  fontStyle: FontStyle.italic,
                                  fontFamily: GoogleFonts.playfair().fontFamily
                              ),
                            },
                          ),
                          ),
                          Spacer(),

                          Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Add Ons',
                                  fontSize: 20,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.black.withOpacity(0.9),
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  fontWeight: FontWeight.w500,
                                ),
                                VerticalSpace(height: 5),

                                SizedBox(
                                  height: 150,
                                  width: screenWidth(context),
                                  child: ListView.builder(
                                    itemCount: 50,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return  SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: Stack(
                                          // alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              height: 150,
                                              width: 150,
                                              margin: EdgeInsets.only(right: 13),

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: ColorUtils.blue.withOpacity(0.2)),
                                              child: Center(
                                                child: Image(image: AssetImage(ImagesUtils.onBoardingOne)),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Image(image: AssetImage('assets/images/plus_icon.png'),height: 30,),
                                              ),
                                            )
                                          ],
                                        ),
                                      ) ;
                                    },
                                  ),
                                ),
                                VerticalSpace(height: 10),
                                MyButton(
                                  radius: 12,
                                  navigateTo: (){
                                    // Navigator.push(context,MaterialPageRoute(builder: (context) => GetProductDataScreen(
                                    //     catId : foodItem.category
                                    // ),));
                                   // Navigator.push(context,MaterialPageRoute(builder: (context) => GetProductDataScreenTwo(catId : foodItem.category)));
                                  },
                                  buttonName: 'CHECK OUT',
                                  buttonColor: Color(0xff49A332),
                                ),
                                VerticalSpace(height: 10),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ) ;
              },
            ) ;
          },
        )
    );
  }
}
