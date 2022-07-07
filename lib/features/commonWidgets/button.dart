// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.txt, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        txt,
      ),
      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
    );
  }
}