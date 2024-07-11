import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';

import '../const/app_colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.textEditingController,
    this.labelText,
    this.hintText,
    this.focusNode,
    this.onTap,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onTap,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.black.withOpacity(0.5),
        ),
        label: labelText != null ? TextView(labelText!) : null,
        border: InputBorder.none,
        fillColor: AppColors.white,
        focusColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        errorBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedErrorBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
      ),
    );
  }
}
