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
    this.prefixIcon,
    this.maxLength,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextInputType? keyboardType;
  final String? errorMessage;
  final Widget? prefixIcon;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF999999)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure ?? false,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          icon: prefixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: const Color(0xFFFFFFFF).withOpacity(0.6)),
          errorText: errorMessage,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 15,
            minWidth: 15,
          ),
        ),
      ),
    );
  }
}
