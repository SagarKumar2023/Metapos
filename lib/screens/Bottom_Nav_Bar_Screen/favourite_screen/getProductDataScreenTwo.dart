import 'package:metapos_sync_order_online_ofline/controller/getProduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetProductDataScreenTwo extends StatefulWidget {
  final int catId;
  const GetProductDataScreenTwo({super.key, required this.catId, });

  @override
  State<GetProductDataScreenTwo> createState() => _GetProductDataScreenTwoState();
}

class _GetProductDataScreenTwoState extends State<GetProductDataScreenTwo> {
  final GetProductController getProductController = Get.put(GetProductController());

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      getProductController.getProduct(widget.catId.toString());
    });
  }

  int _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GetBuilder<GetProductController>(
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
            return PageView.builder(
              itemCount: getPCtr.getProductData.length,
              itemBuilder: (context, index) {
                final data = getPCtr.getProductData[index];
                return Stack(

                  children: [
                    Container(
                      height: screenHeight(context),
                      width: screenWidth(context),
                      color: Color(0xff49A332),
                      child: SafeArea(
                        child: Column(
                          children: [
                            VerticalSpace(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    // if (_currentPage < catCtrr.comboDataList.expand((combo) => combo.foodList).length - 1) {
                                    //   _currentPage++;
                                    //   _pageController.animateToPage(
                                    //     _currentPage,
                                    //     duration: Duration(milliseconds: 300),
                                    //     curve: Curves.easeInOut,
                                    //   );
                                    // }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.arrow_back_ios,color: ColorUtils.white,),
                                  ),
                                ),
                                MyText(
                                  text: 'Food Details',
                                  fontSize: 20,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.white.withOpacity(0.9),
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    // if (_currentPage < catCtrr.comboDataList.expand((combo) => combo.foodList).length - 1) {
                                    //   _currentPage++;
                                    //   _pageController.animateToPage(
                                    //     _currentPage,
                                    //     duration: Duration(milliseconds: 300),
                                    //     curve: Curves.easeInOut,
                                    //   );
                                    // }
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
                                    child: Icon(Icons.favorite_border,color: ColorUtils.white,),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: screenHeight(context) * 0.7,
                        width: screenWidth(context),
                        padding: EdgeInsets.only( top: 110,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          color: ColorUtils.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12,right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: getPCtr.getProductData[index].name,
                                          fontSize:25,
                                          textAlign: TextAlign.start,
                                          textColor: ColorUtils.black.withOpacity(0.9),
                                          softSwap: true,
                                          overflow: TextOverflow.visible,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$ ${getPCtr.getProductData[index].price}',
                                              // '\$ ${_counter * foodItemPrice}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff49A332),
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
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
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: _decrement,
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage('assets/images/minus_icon.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 2),
                                                    child: MyText(
                                                      text: '$_counter',
                                                      fontSize: 16,
                                                      textAlign: TextAlign.center,
                                                      textColor: ColorUtils.white,
                                                      softSwap: true,
                                                      fontWeight: FontWeight.bold,
                                                      overflow: TextOverflow.visible,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  GestureDetector(
                                                    onTap: _increment,
                                                    child: Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage('assets/images/plus_icon.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalSpace(height: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 12,right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage('assets/images/star.png'),height: 20,),
                                      HorizontalSpace(width: 3),
                                      MyText(
                                        text: '4.5',
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        textColor: ColorUtils.black.withOpacity(0.9),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage('assets/images/calories.png'),height: 20,color: ColorUtils.red,),
                                      HorizontalSpace(width: 3),
                                      MyText(
                                        text: '100 Kcl',
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        textColor: ColorUtils.black.withOpacity(0.9),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage('assets/images/time.png'),height: 20,),
                                      HorizontalSpace(width: 3),
                                      MyText(
                                        text: '20 min',
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        textColor: ColorUtils.black.withOpacity(0.9),
                                        softSwap: true,
                                        overflow: TextOverflow.visible,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            VerticalSpace(height: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 12,right: 12),
                              child: MyText(
                                text: 'About  ${getPCtr.getProductData[index].name}',
                                fontSize: 20,
                                textAlign: TextAlign.start,
                                textColor: ColorUtils.black.withOpacity(0.9),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5,right: 12),
                              child: Html(
                                data: getPCtr.getProductData[index].desc,
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
                              padding: EdgeInsets.only(left: 12,right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  VerticalSpace(height: 20),
                                  MyButton(
                                    radius: 12,
                                    navigateTo: ()async{
                                      // var box = HiveBoxes.foodListBox();
                                      // await box.add(getPCtr.getProductData[index]);
                                      //
                                      // SnackBar(
                                      //   content: MyText(
                                      //     text: 'Item added to cart',
                                      //     textColor: ColorUtils.white,
                                      //   ),
                                      // );
                                    },
                                    buttonName: 'Add To Cart',
                                    buttonColor: Color(0xff49A332),
                                  ),
                                  VerticalSpace(height: 20),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 380),
                      child: Center(
                        child: Card(
                          elevation: 3,
                          surfaceTintColor: ColorUtils.white,
                          color: ColorUtils.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Container(
                            height: 200,
                            width: 200,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.white,
                                image: DecorationImage(image: AssetImage('assets/images/food.png'),fit: BoxFit.contain)
                            ),

                          ),
                        ),
                      ),
                    ),
                  ],
                ) ;
              },
            );
          },
        )
    );
  }
}
