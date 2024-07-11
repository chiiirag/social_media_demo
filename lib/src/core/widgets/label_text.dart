import 'package:flutter/material.dart';
import 'package:social_media_demo/src/core/widgets/text_view.dart';

import '../const/app_colors/app_colors.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextView(
      title,
      textColor: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }
}
