import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metapos_sync_order_online_ofline/constant/PrefUtils/PrefUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/controller/register_controller.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/CustomLoader.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class RegisterOtpVerifyScreen extends StatefulWidget {
  final String email;
  final String otp;
  const RegisterOtpVerifyScreen({
    super.key, required this.email, required this.otp,
  });

  @override
  State<RegisterOtpVerifyScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<RegisterOtpVerifyScreen> {
  final OtpFieldController _otpController = OtpFieldController();
  final registerController = Get.put(RegisterController());

  String _enteredOTP = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<RegisterController>(
          init: registerController,
          builder: (controller) {
             return Stack(
               children: [
                 Container(
                   height: screenHeight(context),
                   width: screenWidth(context),
                   decoration:  BoxDecoration(
                       color:    Color(0xffe6fff7)
                   ),
                   child: SafeArea(
                     child: Container(
                       alignment: Alignment.center,
                       padding: const EdgeInsets.only(
                         left: 15,
                         right: 15,
                       ),
                       height: screenHeight(context),
                       width: screenWidth(context),
                       child: SingleChildScrollView(
                         reverse: true,
                         padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SlideInUp(
                               animate: true,
                               duration: Duration(milliseconds: 1070),
                               child: MyRichText(
                                 textAlign: TextAlign.start,
                                 textOne: "Enter 4 Digit ",
                                 textTwo: "OTP",
                                 textTwoColor: ColorUtils.lightSecondaryColor,
                                 textColor: ColorUtils.black,
                                 fontWeight: FontWeight.w700,
                                 fontSize: 32,
                               ),
                             ),
                             VerticalSpace(height: 20),
                             Align(
                               alignment: Alignment.center,
                               child: SlideInUp(
                                 animate: true,
                                 duration: Duration(milliseconds: 1040),
                                 child: Container(
                                   height: 200,
                                   width: 200,
                                   decoration: BoxDecoration(
                                     // color: Colors.red
                                       image: DecorationImage(image: AssetImage('assets/images/otp_locker_image.png'))
                                   ),
                                 ),
                               ),
                             ),
                             const VerticalSpace(height: 5),
                             SlideInUp(
                               animate: true,
                               duration: Duration(milliseconds: 1010),
                               child: MyText(
                                 text: "Sent On Your Mobile +91 ${PrefUtils.getUserPhone()} ",
                                 textColor: ColorUtils.black,
                                 fontWeight: FontWeight.w400,
                                 fontSize: 16,
                               ),
                             ),
                             InkWell(
                               onTap: (){
                                 // var data ={
                                 //   "mobile":widget.mobileNo,
                                 //   "device_type":Platform.isAndroid?"Android":"IOS",
                                 //   "device_token":AppConstant.FCM_TOKEN
                                 // };
                                 // authProvider.resendLoginOtp(data,true);
                               },
                               child: MyText(
                                 text: "Resend OTP",
                                 textColor: ColorUtils.lightSecondaryColor,
                                 fontSize: 16,
                               ),
                             ),
                             const VerticalSpace(height: 20),
                             SlideInUp(
                               animate: true,
                               duration: Duration(milliseconds: 980),
                               child: SizedBox(
                                 height: 60,
                                 child: Theme(
                                   data: Theme.of(context).copyWith(
                                     textSelectionTheme: TextSelectionThemeData(
                                       cursorColor: ColorUtils.lightTextColors,
                                     ),
                                   ),
                                   child: OTPTextField(
                                       length: 4,
                                       fieldWidth: 60,
                                       width: screenWidth(context),
                                       textFieldAlignment: MainAxisAlignment.spaceAround,
                                       fieldStyle: FieldStyle.box,
                                       controller: _otpController,
                                       keyboardType: TextInputType.number,
                                       outlineBorderRadius: 10,
                                       style: GoogleFonts.montserratAlternates(
                                         textStyle: TextStyle(
                                           fontSize: 17,
                                           fontWeight: FontWeight.bold,
                                           color: ColorUtils.black,
                                         ),
                                       ),
                                       otpFieldStyle: OtpFieldStyle(
                                         backgroundColor: ColorUtils.white,
                                         borderColor: ColorUtils.lightTextColors,
                                         focusBorderColor: ColorUtils.lightSecondaryColor,
                                         enabledBorderColor: ColorUtils.lightTextColors,
                                       ),
                                       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                       onCompleted: (pin) {
                                         _enteredOTP = pin;
                                       },
                                       onChanged: (value) {
                                       }),
                                 ),
                               ),
                             ),
                             const VerticalSpace(height: 30),
                             Center(
                               child: SlideInUp(
                                 animate: true,
                                 duration: Duration(milliseconds: 950),
                                 child: MyButton(
                                   margin: EdgeInsets.only(left: 20,right: 20),
                                   // buttonColor: ColorUtils.greenAccent,
                                   height: 50,
                                   width: screenWidth(context),
                                   navigateTo: () {
                                     _verifyAndLogin();
                                   },
                                   buttonName: "Verify Otp",
                                 ),
                               ),
                             ),
                             const VerticalSpace(height: 30),
                             // Visibility(
                             //   child: SlideInUp(
                             //     animate: true,
                             //     duration: Duration(milliseconds: 920),
                             //     child: GestureDetector(
                             //       onTap: () {
                             //         Navigator.pushReplacementNamed(context, Routes.loginScreen);
                             //       },
                             //       child: Row(
                             //         mainAxisAlignment: MainAxisAlignment.center,
                             //         children: [
                             //           TextWidget(
                             //             title: "Already You Have an accont? ",
                             //             textColor: ColorUtils.black,
                             //             fontWeight: FontWeight.w400,
                             //             fontSize: 14,
                             //           ),
                             //           TextWidget(
                             //             title: " Login",
                             //             textColor: ColorUtils.lightSecondaryColor,
                             //             fontWeight: FontWeight.bold,
                             //             fontSize: 14,
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //   ),
                             // ),
                             // const VerticalSpace(height: 30),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
                 controller.isLoading ? CustomLoader():SizedBox.shrink()
               ],
             ) ;
          },
        )
    );
  }

  _verifyAndLogin() {
    if (_enteredOTP.isEmpty) {
      SnackBarUtils.showWarning('Error', 'OTP Field is Required!');
    } else if (_enteredOTP != widget.otp) {
      SnackBarUtils.showWarning('Error', 'Wrong OTP!');
    } else {
      var data = {"email": widget.email, "otp": widget.otp};
      registerController.loginUserVerifyOtp(data);
    }
  }
}
