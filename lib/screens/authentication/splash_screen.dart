import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/PrefUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/BNB_Screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/authentication/register_screen.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  InternetController internetController = Get.put(InternetController());

  Future<void> _navigateBasedOnLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final bool isLoggedIn = PrefUtils.isUserLoggedIn();
    
    //if(internetController.isOnline.value){
      if (isLoggedIn) {
        Get.to(BNBScreen());
      } else {
        Get.to(RegisterScreen());
      }
    // }else{
    //   SnackBarUtils.showWarning(
    //       "No Internet Connection",
    //       "Please check your network and try again."
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    _navigateBasedOnLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}