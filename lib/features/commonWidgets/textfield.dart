import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final int maxLines;
  const CustomTextfield(
      {Key? key,
      required this.controller,
      required this.hinttext,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hinttext,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hinttext';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
