import 'dart:async';
import 'dart:developer';

import 'package:adjemin_pay/component/error_check_paiement.dart';
import 'package:adjemin_pay/component/failled_paiement.dart';
import 'package:adjemin_pay/component/load_check_status.dart';
import 'package:adjemin_pay/component/succes_payement.dart';
import 'package:adjemin_pay/controllers/check_payement_status_controller.dart';
import 'package:adjemin_pay/data/models/operator/operator.dart';
import 'package:adjemin_pay/data/models/payement_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckStatusPayementPage extends StatefulWidget {
  final Operator operatorSelected;
  const CheckStatusPayementPage({super.key, required this.operatorSelected});

  @override
  State<CheckStatusPayementPage> createState() =>
      _CheckStatusPayementPageState();
}

class _CheckStatusPayementPageState extends State<CheckStatusPayementPage> {
  final controller = Get.put(CheckPayementStatusController());

  @override
  void initState() {
    controller.timer = Timer.periodic(const Duration(seconds: 3), (_) {
      print(
          "----------PAYEMENT STATUS : ${controller.payementStatus.value?.status}------------");
      log(controller.payementStatus.value != null
          ? controller.payementStatus.value!.toJson().toString()
          : "null");
      controller.getPayementStatus();
      if (controller.loadCheck.value == false) {
        log('TIMER CANCEL');
        controller.timer?.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      controller.timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Obx(() {
            return controller.error.value != null // si ya erreur
                ? ErrorCkeckPaiement(
                    descriptionError:
                        controller.error.value != 'Erreur survenue'
                            ? controller.error.value
                            : null,
                  )
                : controller.loadCheck.value
                    ? LoadCheckStatusPage(
                        operator: widget.operatorSelected,
                      )
                    //TODO: tema la logic car controller.payementStatus.value est souvent null
                    : controller.payementStatus.value?.status ==
                            Status.successful
                        ? SuccesPayementPage(onTap: () {
                            controller.succesPayement();
                          })
                        : const FailedPaiement();
          }),
        ),
      ),
    );
  }
}

// Get.defaultDialog(
//                 title: 'Voulez-vous vraiment sortir',
//                 content: const Text(
//                   'Nous sommes entrain de verifier votre paiement veuillez patienter',
//                   style: TextStyle(fontFamily: 'poppins'),
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Get.close(2);
//                     },
//                     child: Text('Sortir'),
//                   ),
//                 ])