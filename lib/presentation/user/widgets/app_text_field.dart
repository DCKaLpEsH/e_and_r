import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    this.validator,
    required this.textColor,
    this.icon,
    required this.hintText,
    this.maxLength,
    this.onTap,
    this.enabled,
    this.keyboardType,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color textColor;
  final Widget? icon;
  final String hintText;
  final int? maxLength;
  final VoidCallback? onTap;
  final bool? enabled;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      validator: validator,
      onTap: onTap,
      enabled: enabled ?? true,
      decoration: InputDecoration(
        fillColor: AppColors.alto,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.grey,
            ),
        prefixIcon: icon,
        prefixIconConstraints: const BoxConstraints.tightFor(
          height: 20,
          width: 40,
        ),
        focusedBorder: _inputBorder,
        enabledBorder: _inputBorder,
        focusedErrorBorder: _errorBorder,
        errorBorder: _errorBorder,
      ),
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: textColor,
          ),
      cursorColor: Colors.black,
    );
  }

  final _errorBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.casablanca,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  );
  final _inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.alto,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  );
}
