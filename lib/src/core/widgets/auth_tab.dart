import 'package:flutter/material.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';

import '../const/app_colors/app_colors.dart';

class AuthTab extends StatelessWidget {
  const AuthTab({
    super.key,
    this.isSelected = false,
    required this.title,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          TextView(
            title,
            fontSize: 12,
            textColor: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 3),
          if (isSelected)
            Container(
              width: 35,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(20),
              ),
            )
        ],
      ),
    );
  }
}
