import 'package:flutter/material.dart';
import 'package:social_media_demo/src/core/const/app_colors/app_colors.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color,
    this.textColor,
    required this.title,
    this.borderRadius,
    this.onTap,
  });

  final Color? color;
  final Color? textColor;
  final String title;
  final BorderRadiusGeometry? borderRadius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: TextView(
            title,
            textColor: textColor ?? AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
