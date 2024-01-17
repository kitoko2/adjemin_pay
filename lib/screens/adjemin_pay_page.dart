import 'package:adjemin_pay/component/card_operator.dart';
import 'package:adjemin_pay/component/custom_tabbar_view.dart';
import 'package:adjemin_pay/controllers/adjemin_pay_controller.dart';
import 'package:adjemin_pay/data/models/client_params.dart';
import 'package:adjemin_pay/data/models/create_pay.dart';
import 'package:adjemin_pay/screens/error_page.dart';
import 'package:adjemin_pay/screens/load.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AdjeminPayPage extends StatefulWidget {
  final ClientParams clientParams;
  final CreatePay createPay;
  final String countryCode;
  final VoidCallback sucesPayement;

  const AdjeminPayPage(
      {super.key,
      required this.clientParams,
      required this.createPay,
      required this.countryCode,
      required this.sucesPayement});

  @override
  State<AdjeminPayPage> createState() => _AdjeminPayPageState();
}

class _AdjeminPayPageState extends State<AdjeminPayPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(AdjeminPayController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadAssets();
      await controller.initPayement(
        widget.clientParams.clientId,
        widget.clientParams.clientSecret,
        widget.createPay,
        widget.countryCode,
      );
      controller.sucesPayement = widget.sucesPayement;
      if (!mounted) {
        return;
      }
      if (controller.operators.value != null) {
        //init select Controller
        controller.operatorSelected.value = controller.operators.value!.first;

        controller.tabController = TabController(
            length: controller.operators.value!.length, vsync: this);

        controller.tabController!.addListener(() {
          final index = controller.tabController!.index;
          controller.operatorSelected.value =
              controller.operators.value![index];
          controller.codeOtpController.clear();
          controller.numberController.clear();
        });
      }
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.codeOtpController.dispose();
  //   controller.numberController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Obx(() {
          return controller.load.value
              ? const LoadPage()
              : controller.error.value != null
                  ? ErrorPage(errorText: controller.error.value!)
                  : Obx(() {
                      return controller.operators.value != null
                          ? DefaultTabController(
                              length: controller.operators.value!.length,
                              child: ListView(
                                children: [
                                  Center(
                                    child: LottieBuilder.asset(
                                      'packages/adjemin_pay/assets/lotties/card.json',
                                      height: 250,
                                      width: 250,
                                      repeat: false,
                                    ),
                                  ),
                                  const Text(
                                    'Payer avec',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'poppins',
                                    ),
                                  ),
                                  const Text(
                                    'Adjemin Pay, notre solution sécurisée pour les paiements en ligne.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'poppins',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  TabBar(
                                    isScrollable: true,
                                    controller: controller.tabController,
                                    tabs: List.generate(
                                        controller.operators.value!.length,
                                        (index) {
                                      final operator =
                                          controller.operators.value![index];
                                      return TabOperator(operator: operator);
                                    }),
                                  ),
                                  CustomTabBarView(
                                    controller: controller,
                                    createPay: widget.createPay,
                                  )
                                ],
                              ),
                            )
                          : Container();
                    });
        }),
      ),
    );
  }
}
