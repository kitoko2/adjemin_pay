import 'package:adjemin_pay/component/custom_button.dart';
import 'package:adjemin_pay/component/custom_text_field.dart';
import 'package:adjemin_pay/controllers/adjemin_pay_controller.dart';
import 'package:adjemin_pay/data/models/create_pay.dart';
import 'package:adjemin_pay/data/models/make_pay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarView extends StatelessWidget {
  final AdjeminPayController controller;
  final CreatePay createPay;
  const CustomTabBarView(
      {super.key, required this.controller, required this.createPay});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          controller.operatorSelected.value!.initiationInputs != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      controller.operatorSelected.value!.initiationInputs!
                          .length, (index) {
                    final input = controller
                        .operatorSelected.value!.initiationInputs![index];
                    return CustomTextField(
                      controller: index == 0
                          ? controller.numberController
                          : controller.codeOtpController,
                      initiationInputs: input,
                    );
                  }),
                )
              : Container(),
          const SizedBox(height: 20),
          CustomButton(
            onTap: () {
              if (controller.operatorSelected.value!.initiationInputs == null) {
                return;
              }
              final number = controller.numberController.text.trim();
              final codeOtp = controller.codeOtpController.text.trim();

              if (controller.operatorSelected.value!.initiationInputs!.length ==
                  2) {
                if (number.isEmpty || codeOtp.isEmpty) {
                  print('REQUIRED');
                  return;
                }
              } else {
                if (number.isEmpty) {
                  print('REQUIRED');
                  return;
                }
              }
              MakePay makePay = MakePay(
                amount: createPay.amount,
                gatewayOperatorCode:
                    controller.operatorSelected.value!.payinCode,
                merchantTransId: createPay.merchantTransId,
                customerRecipientNumber: number,
                customerEmail: createPay.customerEmail,
                customerFirstname: createPay.customerFirstname,
                customerLastname: createPay.customerLastname,
                otp: codeOtp,
                webhookUrl: createPay.webhookUrl,
                returnUrl: createPay.returnUrl,
                cancelUrl: createPay.cancelUrl,
              );
              controller.makePayement(makePay);
            },
            title: 'Payer',
          )
        ],
      );
    });

    // TabBarView(
    //   controller: controller.tabController,
    //   children: List.generate(
    //     controller.operators.value!.length,
    //     (index) {
    //       final operator = controller.operators.value![index];
    //       return ListView(
    //         children: [
    //           operator.initiationInputs != null
    //               ? Column(
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: List.generate(operator.initiationInputs!.length,
    //                       (index) {
    //                     final input = operator.initiationInputs![index];
    //                     return CustomTextField(
    //                       controller: index == 0
    //                           ? controller.numberController
    //                           : controller.codeOtpController,
    //                       initiationInputs: input,
    //                     );
    //                   }),
    //                 )
    //               : Container(),
    //           const SizedBox(height: 20),
    //           CustomPaiementButton(
    //             onTap: () {
    //               if (operator.initiationInputs == null) {
    //                 return;
    //               }
    //               final number = controller.numberController.text.trim();
    //               final codeOtp = controller.codeOtpController.text.trim();

    //               if (operator.initiationInputs!.length == 2) {
    //                 if (number.isEmpty || codeOtp.isEmpty) {
    //                   print('REQUIRED');
    //                   return;
    //                 }
    //               } else {
    //                 if (number.isEmpty) {
    //                   print('REQUIRED');
    //                   return;
    //                 }
    //               }
    //               MakePay makePay = MakePay(
    //                 amount: createPay.amount,
    //                 gatewayOperatorCode: operator.payinCode,
    //                 merchantTransId: createPay.merchantTransId,
    //                 customerRecipientNumber:
    //                     number ?? createPay.customerRecipientNumber,
    //                 customerEmail: createPay.customerEmail,
    //                 customerFirstname: createPay.customerFirstname,
    //                 customerLastname: createPay.customerLastname,
    //                 otp: codeOtp,
    //                 webhookUrl: createPay.webhookUrl,
    //                 returnUrl: createPay.returnUrl,
    //                 cancelUrl: createPay.cancelUrl,
    //               );
    //               controller.makePayement(makePay);
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   ),
    // );
  }
}
