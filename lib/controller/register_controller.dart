import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:metapos_sync_order_online_ofline/constant/AppUrl/app_Url.dart';
import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/PrefUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/model/LoginUserVerifyOtpModel.dart';
import 'package:metapos_sync_order_online_ofline/model/RegisterModel.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/BNB_Screen.dart';
import 'package:metapos_sync_order_online_ofline/screens/authentication/register_Otp_verify_screen.dart';

class RegisterController extends GetxController{

  final InternetController internetController = Get.find<InternetController>();

  bool _isLoading = false ;
  bool get isLoading => _isLoading ;

  Future registerUser(data)async{
    _isLoading = true;
    update();

    // if(internetController.isOnline.value){
    http.Response response = await http.post(
        Uri.parse("http://metapos.metapos.com.au/backoffice/public/api/regUser"),
        body: data
    );

    // log("--------------------------  REQUEST DATA  ------------------------------- ");
    // log(data);
    log("URL :- http://metapos.metapos.com.au/backoffice/public/api/regUser");
    log("--------------------------  RESPONSE DATA  ------------------------------- ");
    log(response.body);

    if(response.statusCode == 200){
      RegisterModel registerModel = RegisterModel.fromJson(jsonDecode(response.body));
      if(registerModel.error == '0'){
        PrefUtils.setEmail(registerModel.user!.email.toString());
        PrefUtils.setUserId(registerModel.user!.id.toString());
        PrefUtils.setUserName(registerModel.user!.name.toString());
        PrefUtils.setUserPhone(registerModel.user!.phone.toString());
        SnackBarUtils.showSuccess('OTP','Your OTP for Metapose is ${registerModel.user!.otp}. Valid for 5 minutes. Do not share.');
        Get.to(RegisterOtpVerifyScreen(email:registerModel.user!.email.toString(),otp:registerModel.user!.otp.toString()));
        _isLoading=false;
        update();
      }else if (registerModel.error == '3'){
        SnackBarUtils.showWarning('Error', 'This email already exist!');
        _isLoading =false ;
        update();
      }

    }else{
      SnackBarUtils.showWarning("Error",response.statusCode.toString());
      _isLoading = false ;
      update();
    }
    // }else{
    //   SnackBarUtils.showWarning(
    //       "No Internet Connection",
    //       "Please check your network and try again."
    //   );
    // }
  }

  Future loginUserVerifyOtp(data)async{
    _isLoading = true;
    update();

    if(internetController.isOnline.value){
      http.Response response = await http.post(
          Uri.parse("http://metapos.metapos.com.au/backoffice/public/api/loginUserVerifyOtp"),
          body:data
      );


      log("--------------------------  REQUEST DATA  ------------------------------- ");
      // log(data);
      log("URL :- http://metapos.metapos.com.au/backoffice/public/api/loginUserVerifyOtp");
      log("--------------------------  RESPONSE DATA  ------------------------------- ");
      log(response.body);

      if(response.statusCode == 200){
        LoginUserVerifyOtpModel loginUserVerifyOtpModel = LoginUserVerifyOtpModel.fromJson(jsonDecode(response.body));
        if(loginUserVerifyOtpModel.error == 0){
          PrefUtils.setToken(loginUserVerifyOtpModel.accessToken.toString());
          PrefUtils.setEmail(loginUserVerifyOtpModel.user!.email.toString());
          PrefUtils.setUserPhone(loginUserVerifyOtpModel.user!.phone.toString());
          PrefUtils.setUserId(loginUserVerifyOtpModel.user!.id.toString());
          PrefUtils.setUserLoggedIn(true);
          Get.to(BNBScreen());
          _isLoading = false ;
          update();
        }else{
          SnackBarUtils.showWarning('Error', loginUserVerifyOtpModel.notify.toString());
          _isLoading =false ;
          update();
        }
      }else{
        SnackBarUtils.showWarning('Error', response.statusCode.toString());
        _isLoading = false ;
        update();
      }
    }else{
      SnackBarUtils.showWarning(
          "No Internet Connection",
          "Please check your network and try again."
      );
    }
  }
}