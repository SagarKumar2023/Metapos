import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/category_order_summary_screen.dart';
import 'package:metapos_sync_order_online_ofline/controller/get_category_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/cart_screen_arrowBack_button_source.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/CATEGORIES_AND_FOOD_LIST_DESIGN/categories_food_list_design.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/DEALS/deals_design_Display_data_screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/HALF_AND_HALF/halfAndHalf_design.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/SPECIALS/special_design.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/home_screen/Designs/TRENDING_PRODUCTS/trending_products_desing.dart';
import 'package:metapos_sync_order_online_ofline/widgets/CustomLoader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.getAllCategoryData() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      body: GetBuilder<CategoryController>(
        init: categoryController,
        builder:(categoryController) {
          return categoryController.isLoading?CustomLoader(): CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                toolbarHeight: 0,
                backgroundColor: ColorUtils.black,
                expandedHeight: 300.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    height: 300,
                    width: screenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pizza.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      height: 300,
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.black.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: 3,
                              top: 3,
                            ),
                            // color: ColorUtils.black,
                            child: SafeArea(
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      'assets/icons/menu.png',
                                    ),
                                    height: 35,
                                    color: Colors.white,
                                  ),
                                  // Icon(Icons.drag_handle, color: ColorUtils.white),
                                  HorizontalSpace(width: 30),
                                  Image(
                                    image: AssetImage(
                                      'assets/images/metapose_logo.png',
                                    ),
                                    height: 50,
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: (){
                                        // PersistentNavBarNavigator.pushNewScreen(
                                        //   context,
                                        //   screen: FollowMla(),
                                        //   withNavBar: false,
                                        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        // );
                                      },
                                      child: Icon(Icons.search, color: ColorUtils.white)),
                                  HorizontalSpace(width: 10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_circle_right,
                                      color: ColorUtils.white,
                                    ),
                                  ),
                                  HorizontalSpace(width: 10),
                                  GestureDetector(
                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: CartScreen(source: CartScreenArrowbackButtonSource.showIcon,),
                                        withNavBar: false,
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      color: ColorUtils.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage('assets/images/metapose_logo.png'),
                            height: 100,
                          ),
                          VerticalSpace(height: 10),
                          MyText(
                            text: 'MetaPOS Pizzaria\nMetaPOS 2004 Vic Melborne',
                            fontSize: 25,
                            textColor: ColorUtils.white,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          VerticalSpace(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // List of items
              SliverList(
                delegate: SliverChildListDelegate([
                  TrendingProductsDesign(),
                  // DividerWidget(),
                  ///  Half And Half
                  HalfAndHalfDesign(categoryController: categoryController,),
                  // DividerWidget(),
                  /// Deals
                  DealsDesignDisplayData(categoryController: categoryController,),
                  /// Special
                  SpecialDesign(categoryController:categoryController,),
                  /// Beer-Lager
                  CategoriesFoodListDesign(categoryController: categoryController,),
                  //  VerticalSpace(height: 20),
                  //  /// Mocktails
                  //  DividerWidget(),
                  //  BeerLagerDesign(
                  //    productHeading: 'Mocktails',
                  //    productName: 'Crown Larger(Australia)',
                  //    productDesc: 'Bottle',
                  //    productPrice: '\$ 9.00',
                  //    productImage: 'assets/images/food.png',
                  //  ),
                  //  VerticalSpace(height: 20),
                  //  /// Mocktails
                  //  DividerWidget(),
                  //  BeerLagerDesign(
                  //    productHeading: 'PIZZAS',
                  //    productName: 'BBQ Pizza',
                  //    productDesc: 'Delicious',
                  //    productPrice: '\$ 12.00-\$18.00',
                  //    productImage: 'assets/images/food.png',
                  //  ),
                  //
                  //  /// Traditional Pizza
                  //  TraditionalPizzaDesignDisplayData(),
                  //  /// Gourmet Pizza
                  //  GourmetPizzaDesign(),
                  //  DividerWidget(),
                  //  /// Pasta
                  //  Padding(
                  //    padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
                  //    child: MyText(
                  //      text: 'PASTA',
                  //      fontSize: 20,
                  //      // textAlign: TextAlign.start,
                  //      textColor: ColorUtils.black,
                  //      softSwap: true,
                  //      overflow: TextOverflow.visible,
                  //      fontWeight: FontWeight.bold,
                  //    ),
                  //  ),
                  //  DividerWidget(height: 1.5,),
                  //  /// Traditional Pasta Sauces
                  //  TraditionalPastaDesign(),
                  //
                  //  DividerWidget(),
                  //  /// PREMIUM VEGAN
                  //  Padding(
                  //    padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
                  //    child: MyText(
                  //      text: 'PREMIUM VEGAN',
                  //      fontSize: 20,
                  //      // textAlign: TextAlign.start,
                  //      textColor: ColorUtils.black,
                  //      softSwap: true,
                  //      overflow: TextOverflow.visible,
                  //      fontWeight: FontWeight.bold,
                  //    ),
                  //  ),
                  //  DividerWidget(height: 1.5,),
                  //  /// Vegan Pizzas
                  //  VeganPizzaDesign(),
                  //  /// vegan Pastas
                  //  VeganPastasDesign(),
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// RISOTTO
                  //  RisottoDesign(),
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// BURGER AND MAINS
                  //  BurgerAndMainsDesign(),
                  //
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// SALADS
                  // SaladDesign(),
                  //
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// DESSERTS
                  //  DessertDesign(),
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// BEVERAGES
                  //  BeveragesSoftDrinkDesign(),
                  //
                  //  VerticalSpace(height: 5),
                  //  DividerWidget(),
                  //  /// ALCOHOLIC
                  //  AlcoholicDesign()
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
