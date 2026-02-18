import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

class RazorpayService {
  late Razorpay _razorpay;

  RazorpayService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout({
    required String name,
    required String contact,
    required String email,
    required double amount,
    required String desc,
    required String orderId,
  }) {
    var options = {
      'key': 'rzp_test_mxMwYQ71RMd4iU',
      'amount': (amount * 100).toInt(),
      'name': name,
      'description':desc,
      'prefill': {
        'contact': contact,
        'email': email,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    // var options = {
    //   'key': 'rzp_test_mxMwYQ71RMd4iU',
    //   'amount': (amount * 100).toInt(),
    //   'currency': 'INR',
    //   'name': name,
    //   'description': desc,
    //   'order_id': orderId,
    //   'prefill': {
    //     'contact': contact,
    //     'email': email
    //   },
    //   'notes': {
    //     'note_key_1': 'Note 1',
    //     'note_key_2': 'Note 2',
    //   },
    //   'theme': {
    //     'color': '#3399cc'
    //   },
    //   'external': {
    //     'wallets': ['paytm']
    //   }
    // };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final paymentId = response.paymentId!;
    final orderId = response.orderId!;
    final signature = response.signature!;

    debugPrint("✅ Payment Success:");
    debugPrint("Payment ID: $paymentId");
    debugPrint("Order ID: $orderId");
    debugPrint("Signature: $signature");
    // // 🔐 Verify with backend
    // final verified = await verifyPaymentWithServer(
    //   paymentId: paymentId,
    //   signature: signature,
    //   orderId: orderId,
    // );
    //
    // if (verified) {
    //   // ✅ Save in DB
    //   await savePaymentInDatabase(
    //     paymentId: paymentId,
    //     orderId: orderId,
    //     userId: currentUserId,
    //     amount: finalController.cartAllItemsTotalPrice.value,
    //   );
    //
    //   // ✅ Show success
    //   Get.snackbar('Success', 'Payment Successful!');
    //
    // } else {
    //   Get.snackbar('Error', 'Payment Verification Failed!');
    // }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("❌ Payment Failed: ${response.code} | ${response.message}");
    if (response.code == Razorpay.PAYMENT_CANCELLED) {
      Get.snackbar('Cancel', 'Payment cancelled by user.');
    } else {
      Get.snackbar('Failed', 'Payment failed: ${response.message}');
    }
    Get.snackbar("${response.code}", response.message ?? 'Unknown error');

  }


  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("📱 External Wallet Selected: ${response.walletName}");
    Get.snackbar('Wallet selected: ', response.walletName.toString());
  }


  void dispose() {
    _razorpay.clear();
  }

  Future<bool> verifyPaymentWithServer({
    required String paymentId,
    required String signature,
    required String orderId,
  }) async {
    final response = await http.post(
      Uri.parse("API"),
      body: {
        "razorpay_payment_id": paymentId,
        "razorpay_signature": signature,
        "razorpay_order_id": orderId,
      },
    );

    return response.statusCode == 200 && jsonDecode(response.body)["status"] == "success";
  }
}

// class RazorpayService {
//   late Razorpay _razorpay;
//
//   RazorpayService() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   void openCheckout({
//     required String name,
//     required String contact,
//     required String email,
//     required double amount,
//     required String desc,
//     required String orderId, // 👈 from backend
//   }) {
//     var options = {
//       'key': 'rzp_live_YOUR_LIVE_KEY_HERE', // 👈 Use live key in production
//       'amount': (amount * 100).toInt(),
//       'currency': 'INR',
//       'name': name,
//       'description': desc,
//       'order_id': orderId, // 👈 Order ID from backend
//       'prefill': {
//         'contact': contact,
//         'email': email,
//       },
//       'notes': {
//         'user_note': 'Online Order',
//       },
//       'theme': {
//         'color': '#3399cc'
//       },
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error opening Razorpay: $e');
//     }
//   }
//
//   /// Handle successful payment
//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     final paymentId = response.paymentId!;
//     final orderId = response.orderId!;
//     final signature = response.signature!;
//
//     debugPrint("✅ Payment Success:");
//     debugPrint("Payment ID: $paymentId");
//     debugPrint("Order ID: $orderId");
//     debugPrint("Signature: $signature");
//
//     // Optional: show loader while verifying
//     CustomLoader();
//
//     final verified = await verifyPaymentWithServer(
//       paymentId: paymentId,
//       signature: signature,
//       orderId: orderId,
//     );
//
//     if (verified) {
//       // Save payment in database (adjust as per your model)
//       await savePaymentInDatabase(
//         paymentId: paymentId,
//         orderId: orderId,
//         userId: currentUserId,
//         amount: finalController.cartAllItemsTotalPrice.value,
//       );
//
//       Get.snackbar('Payment Successful', 'Thank you for your purchase!');
//
//       // Optionally navigate to success screen
//       // Get.to(SuccessScreen());
//     } else {
//       Get.snackbar('Verification Failed', 'Could not verify payment. Contact support.');
//     }
//   }
//
//   /// Handle payment failure
//   void _handlePaymentError(PaymentFailureResponse response) {
//     debugPrint("❌ Payment Failed: ${response.code} | ${response.message}");
//
//     if (response.code == Razorpay.PAYMENT_CANCELLED) {
//       Get.snackbar('Cancelled', 'Payment was cancelled by user.');
//     } else {
//       Get.snackbar('Payment Failed', response.message ?? 'Unknown error occurred.');
//     }
//   }
//
//   /// Handle external wallets (e.g. Paytm)
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     debugPrint("📱 External Wallet Selected: ${response.walletName}");
//     Get.snackbar('Wallet Selected', response.walletName ?? '');
//   }
//
//   /// Cleanup
//   void dispose() {
//     _razorpay.clear();
//   }
//
//   /// Verify Razorpay signature via backend
//   Future<bool> verifyPaymentWithServer({
//     required String paymentId,
//     required String signature,
//     required String orderId,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse("https://yourdomain.com/api/verify-payment"), // 👈 Replace with your backend endpoint
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "razorpay_payment_id": paymentId,
//           "razorpay_signature": signature,
//           "razorpay_order_id": orderId,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data["status"] == "success";
//       } else {
//         debugPrint("Verification failed with status: ${response.statusCode}");
//         return false;
//       }
//     } catch (e) {
//       debugPrint("Verification exception: $e");
//       return false;
//     }
//   }
//
//   /// Mock: Save payment in database (replace with real DB or API)
//   Future<void> savePaymentInDatabase({
//     required String paymentId,
//     required String orderId,
//     required String userId,
//     required double amount,
//   }) async {
//     debugPrint("Saving payment to DB...");
//     debugPrint("User: $userId, Amount: $amount, Order: $orderId, Payment: $paymentId");
//
//     // TODO: Send data to your backend via API call
//   }
// }


