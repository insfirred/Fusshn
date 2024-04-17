import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  const TextFieldAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscure,
    this.keyboardType,
    this.errorMessage,
    this.maxCharaters,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextInputType? keyboardType;
  final String? errorMessage;
  final int? maxCharaters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxCharaters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorMessage,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 15,
          minWidth: 15,
        ),
      ),
    );
  }
}
