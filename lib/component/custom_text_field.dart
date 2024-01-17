import 'package:adjemin_pay/data/models/operator/initiation_input.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final InitiationInputs initiationInputs;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.initiationInputs, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[100],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: initiationInputs.label,
              hintText: initiationInputs.placeholder,
              prefixIcon: initiationInputs.type == 'tel'
                  ? const Icon(Icons.flag, color: Colors.grey)
                  : const Icon(Icons.fiber_manual_record_sharp),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              labelStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            validator: initiationInputs.isRequired!
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez remplir ce champ';
                    }
                    return null;
                  }
                : null,
          ),
        ),
        if (initiationInputs.message != null)
          Text(
            initiationInputs.message!,
            style: const TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
            ),
          )
      ],
    );
  }
}
