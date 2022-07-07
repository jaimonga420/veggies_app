import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.label,
      required this.keyboardType,
      required this.textEditingController,
      required this.hintText,
      this.maxLength,
      Key? key, })
      : super(key: key);

  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
