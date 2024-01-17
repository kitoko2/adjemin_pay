import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailedPaiement extends StatelessWidget {
  final String? descriptionError;
  const FailedPaiement({super.key, this.descriptionError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          LottieBuilder.asset(
            'packages/adjemin_pay/assets/lotties/error.json',
            repeat: false,
            height: 200,
          ),
          const SizedBox(height: 30),
          const Text(
            'Echec du paiement',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            descriptionError ?? 'Echec lors du paiement',
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'poppins', color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
