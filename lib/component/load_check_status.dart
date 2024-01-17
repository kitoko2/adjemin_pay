import 'package:adjemin_pay/data/models/operator/operator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadCheckStatusPage extends StatelessWidget {
  final Operator operator;

  const LoadCheckStatusPage({super.key, required this.operator});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              LottieBuilder.asset(
                'packages/adjemin_pay/assets/lotties/money.json',
                height: 200,
              ),
              const Text(
                'Verification du status de payement',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Text(
                'Nous verifions le status de votre payement veuillez patienter',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'poppins', color: Colors.grey),
              ),
              const SizedBox(height: 30),
              if (operator.isRequireApproval!)
                Text(
                  operator.approvalMessage ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 17,
                  ),
                ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LottieBuilder.asset(
            'packages/adjemin_pay/assets/lotties/load.json',
            height: 200,
          ),
        )
      ],
    );
  }
}
