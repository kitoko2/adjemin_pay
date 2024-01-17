library adjemin_pay;

import 'package:adjemin_pay/data/models/client_params.dart';
import 'package:adjemin_pay/data/models/create_pay.dart';
import 'package:adjemin_pay/screens/adjemin_pay_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdjeminPay {
  static void pay(
    BuildContext context, {
    required String countryCode,
    required VoidCallback succesPaiement,
    required ClientParams clientParams,
    required CreatePay createPay,
  }) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: AdjeminPayPage(
              countryCode: countryCode,
              clientParams: clientParams,
              createPay: createPay,
              sucesPayement: succesPaiement,
            ),
          );
        },
      ),
    );
  }
}
