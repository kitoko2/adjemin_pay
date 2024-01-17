import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(),
              Text(
                'Bienvenue sur notre interface de paiement',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 20,
                ),
              ),
              Divider(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LottieBuilder.asset(
              'packages/adjemin_pay/assets/lotties/load.json',
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
