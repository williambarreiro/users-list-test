import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool onlyNumbers;

  const DefaultInputField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.onlyNumbers = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType:
              onlyNumbers ? const TextInputType.numberWithOptions() : null,
          inputFormatters:
              onlyNumbers ? [FilteringTextInputFormatter.digitsOnly] : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
