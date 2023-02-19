// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pcet_placements/presentation/theme/app_colors.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          fillColor: AppColors.mercury,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
