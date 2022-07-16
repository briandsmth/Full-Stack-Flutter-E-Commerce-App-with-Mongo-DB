// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {Key? key, required this.txt, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        txt,
        style: TextStyle(color: color == null ? Colors.white : Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), primary: color),
    );
  }
}
