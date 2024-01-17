import 'package:adjemin_pay/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesPayementPage extends StatelessWidget {
  final VoidCallback onTap;
  const SuccesPayementPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          LottieBuilder.asset(
            'packages/adjemin_pay/assets/lotties/checked.json',
            repeat: false,
            height: 200,
          ),
          const SizedBox(height: 30),
          const Text(
            'Paiement effectué avec succes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Text(
            'Votre paiement a été effectué avec succès merci de nous faire confiance',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'poppins', color: Colors.grey),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onTap: onTap,
            title: 'Compris',
          )
          // TextButton(onPressed: onTap, child: Text('Compris'))
        ],
      ),
    );
  }
}
