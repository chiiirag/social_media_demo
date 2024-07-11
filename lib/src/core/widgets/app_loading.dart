import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        50.h.verticalSpace,
        const CircularProgressIndicator(
          color: Colors.black,
        ),
        50.h.verticalSpace,
      ],
    );
  }
}
