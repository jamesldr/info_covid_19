import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final Widget? suffixWidget;
  final bool obscureText;
  const AppTextField({
    Key? key,
    required this.label,
    this.onChanged,
    this.suffixWidget,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        iconColor: Colors.black,
        suffixIconColor: Colors.black,
        focusColor: Colors.black,
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.black),
        isDense: true,
        filled: true,
        suffixIcon: suffixWidget,
      ),
    );
  }
}
