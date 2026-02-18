import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/register_controller.dart';
import 'package:metapos_sync_order_online_ofline/widgets/CustomLoader.dart';
import 'package:metapos_sync_order_online_ofline/widgets/MyTextButton.dart';
import 'package:metapos_sync_order_online_ofline/widgets/TextField_widget.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/screen_Size.dart';
import 'package:metapos_sync_order_online_ofline/constant/spacer.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Button_widget.dart';
import 'package:metapos_sync_order_online_ofline/widgets/Text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController setPasswordCtr = TextEditingController();
  bool obscureText = true;
  bool isChecked = false;

  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      body: GetBuilder<RegisterController>(
        init: registerController,
        builder: (controller) {
          return Stack(
            children: [
              Container(
                height: screenHeight(context),
                width: screenWidth(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffe6fff7),
                      Color(0xffefffff),
                      Color(0xffefffff),
                      Color(0xffefffff),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      text: 'Get Started',
                                      fontSize:35,
                                      textAlign: TextAlign.center,
                                      textColor: ColorUtils.grey,
                                      softSwap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    Image(image: AssetImage('assets/images/logo_mono.png'),height: 50)
                                  ],
                                ),
                                VerticalSpace(height: 20),

                                MyText(
                                  text: 'Full Name',
                                  fontSize: 16,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.colorBlack,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                VerticalSpace(height: 5),
                                MyTextField(
                                  controller: fullNameCtr,
                                  fillColor: ColorUtils.white,
                                  borderRadius: 100,
                                  hintText: "Enter Full Name",
                                  keyboardType: TextInputType.name,
                                ),
                                VerticalSpace(height: 10),
                                MyText(
                                  text: 'Email',
                                  fontSize: 16,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.colorBlack,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                VerticalSpace(height: 5),
                                MyTextField(
                                  fillColor: ColorUtils.white,
                                  borderRadius: 100,
                                  controller: emailCtr,
                                  hintText: "Enter Email",
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                VerticalSpace(height: 10),
                                MyText(
                                  text: 'Phone Number',
                                  fontSize: 16,
                                  textAlign: TextAlign.center,
                                  textColor:ColorUtils.colorBlack,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                VerticalSpace(height: 5),
                                MyTextField(
                                  controller: phoneCtr,
                                  fillColor: ColorUtils.white,
                                  borderRadius: 100,
                                  hintText: "Mobile number",
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (value) {
                                    // Trigger validation when text changes
                                    setState(() {
                                      // _formKey.currentState?.validate();
                                    });
                                  },
                                  preFixIcon: Container(
                                    width: 46,
                                    height: 18,
                                    margin: const EdgeInsets.only(left: 8),
                                    alignment: Alignment.center,
                                    // color: Colors.red,
                                    child: Row(
                                      children: [
                                        MyText(
                                          text: "+91",
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 15,
                                          color: ColorUtils.black,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 1,
                                          color: ColorUtils.black,
                                        ),
                                        const HorizontalSpace(width: 3)
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),
                                MyText(
                                  text: 'Set Password',
                                  fontSize: 16,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black.withOpacity(0.7),
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                VerticalSpace(height: 5),
                                MyTextField(
                                  hintText: "Enter password",
                                  controller: setPasswordCtr,
                                  keyboardType: TextInputType.visiblePassword,
                                  fillColor: ColorUtils.white,
                                  borderRadius: 100,
                                  obscureText: obscureText,
                                  suffixIcon: Container(
                                    height: 10,
                                    width: 10,
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: Icon(
                                          obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color:  ColorUtils.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide.none
                                ),
                                side: BorderSide(color: Colors.transparent),
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue ?? false;
                                  });
                                },
                              ),
                              MyText(
                                text: 'I Accept the ',
                                fontSize: 14,
                                textColor: ColorUtils.black.withOpacity(0.7),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                              MyTextButton(navigateTo: (){},buttonName: 'Term of Service ',textColor: ColorUtils.blue,),
                              MyText(
                                text: 'and ',
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.black.withOpacity(0.7),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                              MyTextButton(navigateTo: (){},buttonName: 'Privacy Policy',textColor: ColorUtils.blue,fontSize: 14,)
                            ],
                          ),
                          VerticalSpace(height: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: MyButton(
                              navigateTo: (){
                                _validateAndRegister();
                              }, buttonName: 'Register',),
                          ),
                          VerticalSpace(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: ColorUtils.black,
                                ),
                              ),
                              HorizontalSpace(width: 10),
                              MyText(
                                text: 'Or with',
                                fontSize: 16,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.black.withOpacity(0.7),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                              HorizontalSpace(width: 10),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: ColorUtils.black,
                                ),
                              ),
                            ],
                          ),
                          VerticalSpace(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: 'Already have an account?',
                                fontSize: 18,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.black.withOpacity(0.7),
                                softSwap: true,
                                overflow: TextOverflow.visible,
                              ),
                              MyTextButton(navigateTo: (){
                                // Get.to(LoginS)
                                // Navigator.pushReplacementNamed(context, Routes.login);
                              },buttonName: ' Log in',textColor: ColorUtils.black,fontWeight: FontWeight.bold,fontSize: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              registerController.isLoading?CustomLoader():SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }

  void _validateAndRegister() {
    String name = fullNameCtr.text.trim();
    String mobileNumber = phoneCtr.text.trim();
    String email = emailCtr.text.trim();
    String password = setPasswordCtr.text.trim();

    // Validation for name
    if (name.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
      return;
    } else if (name.length < 2) {
      SnackBarUtils.showWarning('Warning', 'Name must be at least 2 characters long.');
      return;
    }

    // Validation for email
    if (email.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
      return;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      SnackBarUtils.showWarning('Warning', 'Please enter a valid email address.');
      return;
    }


    // Validation for mobile number
    if (mobileNumber.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Mobile number cannot be empty.');
      return;
    } else if (mobileNumber.length != 10) {
      SnackBarUtils.showWarning('Warning', 'Please enter a valid 10-digit mobile number.');
      return;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
      SnackBarUtils.showWarning('Warning', 'Mobile number must contain only digits.');
      return;
    }

    // Validation for password
    if (password.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Password cannot be empty.');
      return;
    } else if (password.length < 6) {
      SnackBarUtils.showWarning('Warning', 'Password must be at least 6 characters long.');
      return;
    }

    final data = {
      "email":email,
      "phone":mobileNumber,
      "password":password,
      "name":name,
      "typeReg":"email",
      "photoUrl":""
    };
    registerController.registerUser(data);

  }
}
