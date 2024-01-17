import 'dart:developer';

import 'package:adjemin_pay/data/models/create_pay.dart';
import 'package:adjemin_pay/data/models/make_pay.dart';
import 'package:adjemin_pay/data/models/operator/operator.dart';
import 'package:adjemin_pay/data/models/payement/payement.dart';
import 'package:adjemin_pay/data/models/payement_status.dart';
import 'package:adjemin_pay/screens/check_status_payement.dart';
import 'package:adjemin_pay/services/merchand_services.dart';
import 'package:adjemin_pay/services/operators_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AdjeminPayController extends GetxController {
  VoidCallback? sucesPayement;

  //--------------------------------
  final load = false.obs;
  final error = Rx<String?>(null);
  //--------------------------------
  final accesToken = Rx<String?>(null);
  final payement = Rx<Payement?>(null);
  final operators = Rx<List<Operator>?>(null);
  final operatorSelected = Rx<Operator?>(null);

  final payementStatus = Rx<PayementStatus?>(null);
  final payementIsMake = false.obs;

  TabController? tabController;
  TextEditingController numberController = TextEditingController();
  TextEditingController codeOtpController = TextEditingController();

  Future<void> loadAssets() async {
    await rootBundle.load("assets/fonts/Poppins-Regular.ttf");
    final police = FontLoader("poppins");
    police.addFont(rootBundle.load("assets/fonts/Poppins-Regular.ttf"));
    await police.load();
  }

  Future<String?> getMerchandAccesToken(
      String clientId, String clientSecret) async {
    final res = await MerchandServices.getAccesToken(
        clientId: clientId, clientSecret: clientSecret);
    return res;
  }

  Future<Payement?> createPayement(
      CreatePay createPay, String accesToken) async {
    final res = await MerchandServices.createPayement(
      accesToken: accesToken,
      createPay: createPay,
    );
    return res;
  }

  initPayement(String clientId, String clientSecret, CreatePay createPay,
      String countryCode) async {
    load.value = true;
    final accesToken = await getMerchandAccesToken(clientId, clientSecret);
    if (accesToken == null) {
      // error
      load.value = false;
      return;
    }

    this.accesToken.value = accesToken;
    final payement = await createPayement(createPay, accesToken);
    if (payement == null) {
      // error
      load.value = false;
      return;
    }
    this.payement.value = payement;

    final operators = await getOperators(countryCode);
    if (operators == null) {
      // error
      load.value = false;
      return;
    }
    this.operators.value = operators;
    error.value = null;
    load.value = false;
  }

  Future<List<Operator>?> getOperators(String countryCode) async {
    final res = await OperatorService.getOperatorByCountry(countryCode);
    return res;
  }

  selectOperator(Operator operator) {
    operatorSelected.value = operator;
  }

  makePayement(MakePay makePay) async {
    load.value = true;
    final resultMakePayement = await MerchandServices.makePayement(
      accesToken: accesToken.value!,
      makePay: makePay,
    );
    payementIsMake.value = resultMakePayement.res;
    if (resultMakePayement.res) {
      if (resultMakePayement.payementUrl != null) {
        _launchUrl(resultMakePayement.payementUrl!);
      }
      load.value = false;
      Navigator.pushReplacement(Get.context!,
          MaterialPageRoute(builder: (context) {
        return CheckStatusPayementPage(
          operatorSelected: operatorSelected.value!,
        );
      }));
      // Get.off(
      //   CheckStatusPayementPage(
      //     operatorSelected: operatorSelected.value!,
      //   ),
      // );
    }

    load.value = false;
  }

  static Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse("$url");
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      log('Could not launch $_url');
    }
  }
}
