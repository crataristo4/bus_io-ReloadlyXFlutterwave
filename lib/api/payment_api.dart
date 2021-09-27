import 'package:flutter/cupertino.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';

class PaymentApi with ChangeNotifier {
  PaymentApi._();

  static String? _currency;
  static String? _reference;
  static String? _email;

  static String? _phoneNumber;
  static PaymentApi? _instance;

  static get currency => _currency;

  static get reference => _reference;

  static get email => _email;

  static get phoneNumber => _phoneNumber;

  saveData(currency, reference, email, phoneNumber) {
    _currency = currency;
    _reference = reference;
    _email = email;
    _phoneNumber = phoneNumber;

    notifyListeners();
  }

  static PaymentApi get instance {
    return _instance == null ? _instance = PaymentApi._() : _instance!;
  }

  static beginPayment(BuildContext context) async {
    final Flutterwave flutterWave = Flutterwave.forUIPayment(
        context: context,
        encryptionKey: "FLWSECK_TEST8b996dd62456",
        publicKey: "FLWPUBK_TEST-b2ce63d2a8a289258be56702c2e02cb2-X",
        currency: currency,
        amount: '100',
        email: "crataristo4@gmail.com",
        fullName: "Test",
        txRef: reference,
        isDebugMode: true,
        phoneNumber: "0207824082",
        acceptCardPayment: true,
        acceptUSSDPayment: true,
        acceptAccountPayment: true,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: true,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: true,
        acceptUgandaPayment: true,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
          await flutterWave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          print("woooww");
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      print(error);
    }
  }

  static bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == currency &&
        response.data!.amount == '100' &&
        response.data!.txRef == reference;
  }
}
