import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:
          (value) =>
              value == null || value.isEmpty
                  ? 'Please enter your $label'
                  : null,

      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontFamily: "TenorSans",
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
