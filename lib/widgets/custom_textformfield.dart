import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.label,
    required this.keyboardType,
    required this.textEditingController,
    this.maxLength,
    Key? key,
  }) : super(key: key);

  final String label;

  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: textEditingController,
      keyboardType: keyboardType,
      maxLength: maxLength,
      autocorrect: true,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
