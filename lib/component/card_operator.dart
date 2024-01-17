import 'package:adjemin_pay/data/models/operator/operator.dart';
import 'package:flutter/material.dart';

class TabOperator extends StatelessWidget {
  final Operator operator;
  const TabOperator({super.key, required this.operator});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      operator.image ??
                          'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              operator.name ?? '',
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
