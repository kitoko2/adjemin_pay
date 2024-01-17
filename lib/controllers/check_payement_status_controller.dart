import 'dart:async';
import 'dart:developer';

import 'package:adjemin_pay/controllers/adjemin_pay_controller.dart';
import 'package:adjemin_pay/data/models/payement_status.dart';
import 'package:adjemin_pay/services/merchand_services.dart';
import 'package:get/get.dart';

class CheckPayementStatusController extends GetxController {
  final adjeminPayController = Get.find<AdjeminPayController>();
  Timer? timer;

  final loadCheck = Rx<bool>(true);
  final error = Rx<String?>(null);
  final payementStatus = Rx<PayementStatus?>(null);

  getPayementStatus() async {
    final res = await MerchandServices.getPayementStatus(
      idTransaction: adjeminPayController.payement.value!.merchantTransId!,
      accesToken: adjeminPayController.accesToken.value!,
    );
    error.value = res.errorMessage;
    if (res.payementStatus != null) {
      log(res.payementStatus!.status.toString());
      if (res.payementStatus!.status == Status.successful ||
          res.payementStatus!.status == Status.failed) {
        payementStatus.value = res.payementStatus;
        loadCheck.value = false;
        // close timer
        timer?.cancel();
        log('TIMER CANCEL');
      } else {
        print('LE status ne correspond pas');
      }
    }
    if (res.errorMessage != null) {
      // si ya erreur
      if (res.loadCheck == false) {
        // close timer
        timer?.cancel();
        log('TIMER CANCEL');
      }
    }
  }

  succesPayement() {
    if (adjeminPayController.sucesPayement != null) {
      adjeminPayController.sucesPayement!();
    }
  }
}
