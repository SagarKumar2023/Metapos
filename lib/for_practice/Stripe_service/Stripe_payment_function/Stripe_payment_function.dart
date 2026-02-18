import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:metapos_sync_order_online_ofline/for_practice/Stripe_service/stripe_utils/stripe_utils.dart';

class StripeTestService {
  Map<String, dynamic>? paymentIntentData;

  /// Call this function to test everything
  Future<void> testAllStripeActions() async {
    await initStripe();
    await createAndHandlePayment();
  }

  Future<void> initStripe() async {
    Stripe.publishableKey = StripeUtils.publishableKey;
    await Stripe.instance.applySettings();
  }

  /// 1. Create PaymentIntent + confirm it via Payment Sheet
  Future<void> createAndHandlePayment() async {
    paymentIntentData = await createPaymentIntent('1000', 'USD'); // $10

    if (paymentIntentData == null) return;

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        merchantDisplayName: 'Test Shop',
        googlePay: PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          currencyCode: 'USD',
          testEnv: true,
        ),
        style: ThemeMode.light,
      ),
    );

    try {
      await Stripe.instance.presentPaymentSheet();
      log("✅ Payment Successful!");
    } catch (e) {
      log("❌ Error in Payment Sheet: $e");
    }
  }

  /// 2. Create PaymentIntent manually for other actions
  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse(StripeUtils.apikey),
        headers: {
          'Authorization': 'Bearer ${StripeUtils.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (int.parse(amount) * 100).toString(),
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );

      return json.decode(response.body);
    } catch (e) {
      log('❌ createPaymentIntent error: $e');
      return null;
    }
  }

  /// 3. Create a PaymentMethod manually
  Future<void> createPaymentMethod() async {
    final billingDetails = BillingDetails(
      email: 'test@example.com',
      phone: '+11234567890',
      address: Address(
        city: 'City',
        country: 'US',
        line1: '123 Test Street',
        line2: '',
        state: 'CA',
        postalCode: '12345',
      ),
    );

    final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(paymentMethodData: PaymentMethodData())

      // PaymentMethodParams.card(
      //   billingDetails: billingDetails,
      //   paymentMethodData: null,
      // ), params: null,
    );

    log("✅ Created PaymentMethod: ${paymentMethod.id}");
  }

  /// 4. Confirm a Payment (manually, instead of using payment sheet)
  Future<void> confirmPayment() async {
    final paymentMethod = await Stripe.instance.createPaymentMethod(
       params: PaymentMethodParams.card(
           paymentMethodData: PaymentMethodData(

           )
       ),
    );

    final paymentIntent = await Stripe.instance.confirmPayment(
      paymentIntentClientSecret: paymentIntentData!['client_secret'],
      data: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );

    log("✅ Confirmed PaymentIntent: ${paymentIntent.id}");
  }

  /// 5. Handle 3D Secure (if needed)
  // Future<void> handleNextAction() async {
  //   final paymentIntent = await Stripe.instance.handleNextAction(
  //
  //
  //   );
  //
  //   log("✅ Handled 3DSecure Next Action: ${paymentIntent.status}");
  // }

  /// 6. Check Apple Pay support (only iOS)
  Future<void> checkApplePaySupport() async {
    // bool isSupported = await Stripe.instance.isApplePaySupported();
    bool isSupported = await Stripe.instance.isPlatformPaySupported(
      googlePay: IsGooglePaySupportedParams(
        existingPaymentMethodRequired: true,
        supportsTapToPay: true,
        testEnv: true
      )
    );

    log("Apple Pay supported: $isSupported");
  }

  /// 7. Present Apple Pay Sheet (iOS only)
  Future<void> presentApplePay() async {
    await Stripe.instance.presentPaymentSheet(
      options: PaymentSheetPresentOptions(
        timeout: int.fromEnvironment(AutofillHints.addressCity)
      ),
    );
  }

  /// 8. Confirm Apple Pay Payment (iOS only)
  Future<void> confirmApplePayPayment() async {
    // await Stripe.instance.confirmApplePayPayment(paymentIntentData!['client_secret']);
    await Stripe.instance.confirmPayment(
      paymentIntentClientSecret:paymentIntentData!['client_secret'] ,
      data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              email: 'test@example.com',
              phone: '+11234567890',
              address: Address(
                city: 'City',
                country: 'US',
                line1: '123 Test Street',
                line2: '',
                state: 'CA',
                postalCode: '12345',
              ),
            )
          )
      ) ,
      options:PaymentMethodOptions(setupFutureUsage:PaymentIntentsFutureUsage.OnSession )
    );

    log("✅ Confirmed Apple Pay Payment");
  }

  /// 9. Confirm Setup Intent (for saving cards for later)
  Future<void> confirmSetupIntent(String setupIntentClientSecret) async {
    final setupIntent = await Stripe.instance.confirmSetupIntent(
       paymentIntentClientSecret:setupIntentClientSecret,
      params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
              billingDetails: BillingDetails(

              )
          )
      ),
    );

    log("✅ Confirmed SetupIntent: ${setupIntent.id}");
  }

  /// 10. Retrieve PaymentIntent
  Future<void> retrievePaymentIntent() async {
    final intent = await Stripe.instance.retrievePaymentIntent(paymentIntentData!['client_secret']);
    log("✅ Retrieved PaymentIntent: ${intent.status}");
  }

  /// 11. Create token for CVC update (very rare use-case)
  Future<void> createTokenForCVCUpdate() async {
    final token = await Stripe.instance.createTokenForCVCUpdate('123');
    log("✅ Created CVC Update Token: $token");
  }

}
