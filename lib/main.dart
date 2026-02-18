import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/CategoryPriceController.dart';
import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/Prefs.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/HalfNHalfPriceController.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/deals_price_conroller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/cart_all_Items_total_price_controller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/special_deals_price_conroller.dart';
import 'package:metapos_sync_order_online_ofline/screens/authentication/splash_screen.dart';
import 'Hive_database/Hive_utils/Hive_Servce_Init.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controller/internet_contoller.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServiceInit.init();
  await Prefs.init();
  // Stripe.publishableKey = StripeUtils.publishableKey ;
  // Stripe.merchantIdentifier = 'com.example.metapos_sync_order_online_ofline';
  // Stripe.instance.applySettings();
  Get.put(InternetController());
  Get.put(CategoryPriceCartController());
  Get.put(DealsPriceCartController());
  Get.put(HalfNHalfPriceCartController());
  Get.put(SpecialDealsPriceCartController());
  Get.put(CartAllItemsTotalPriceController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Api and Hive DataBase Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}