import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  final String errorText;
  const ErrorPage({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'packages/adjemin_pay/assets/lotties/error.json',
                repeat: false,
                width: 200,
              ),
              const SizedBox(height: 10),
              Text(
                errorText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontFamily: 'poppins'),
              ),
              const Text(
                'Une erreur est survenue, veuillez recommencer.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'poppins',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
