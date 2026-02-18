// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
//
//
// class InternetController extends GetxController {
//   var isOnline = false.obs;
//   final Connectivity _connectivity = Connectivity();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _checkInitialStatus();
//     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
//       _updateConnectionStatus(results);
//     });
//   }
//
//   Future<void> _checkInitialStatus() async {
//     final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
//     _updateConnectionStatus(results);
//   }
//
//   void _updateConnectionStatus(List<ConnectivityResult> results) {
//     final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
//
//     if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
//       if (!isOnline.value) {
//         // Online mode popup
//         Get.snackbar(
//           "Online Mode",
//           "You are back online!",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: const Color(0xFF4CAF50),
//           colorText: Colors.white,
//           duration: const Duration(seconds: 2),
//         );
//         isOnline.value = true;
//       }
//     } else {
//       if (isOnline.value) {
//         // Ask user before switching offline
//         Get.defaultDialog(
//           title: "Offline Mode",
//           middleText: "No Internet Connection.\nSwitch to Offline Mode?",
//           confirm: ElevatedButton(
//             onPressed: () {
//               isOnline.value = false;
//               Get.back();
//             },
//             child: const Text("Switch"),
//           ),
//           cancel: TextButton(
//             onPressed: () => Get.back(),
//             child: const Text("Cancel"),
//           ),
//         );
//       } else {
//         isOnline.value = false;
//       }
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/order_summary_screens/category_order_summary_screen.dart';

class InternetController extends GetxController {
  var isOnline = false.obs;
  var refreshTrigger = false.obs;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _checkInitialStatus();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  Future<void> _checkInitialStatus() async {
    final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

    if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      if (!isOnline.value) {
        isOnline.value = true;
        SnackBarUtils.showSuccess("Online Mode","You are back online!");
        refreshTrigger.toggle();
        // Get.snackbar(
        //   "Online Mode",
        //   "You are back online!",
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: const Color(0xFF4CAF50),
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 2),
        // );
      }
      return;
    }

    if (isOnline.value) {
      // Mark OFFLINE immediately
      isOnline.value = false;

      final context = Get.context!;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: MyText(
              text: 'OFFLINE MODE',
              fontSize: 18,
              textColor: ColorUtils.black,
              softSwap: true,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
              height: 87,
              child: Column(
                children: [
                  MyText(
                    text: 'No Internet Connection. Switch to Offline Mode?',
                    fontSize: 14,
                    textColor: ColorUtils.black.withOpacity(0.8),
                    softSwap: true,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  VerticalSpace(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CANCEL BUTTON
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ColorUtils.grey,
                          ),
                          child: Center(
                            child: MyText(
                              text: 'Cancel',
                              fontSize: 14,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      HorizontalSpace(width: 10),

                      // SWITCH BUTTON
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          isOnline.value = false;
                        },
                        child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ColorUtils.blue,
                          ),
                          child: Center(
                            child: MyText(
                              text: 'Switch',
                              fontSize: 14,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }

}

