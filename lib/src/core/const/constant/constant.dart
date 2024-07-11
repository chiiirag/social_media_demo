import 'package:flutter/material.dart';

class AppConstant {
  static final bottomList = [
    BottomModel(Icons.home, ""),
    BottomModel(Icons.chat_bubble_outline_outlined, ""),
    BottomModel(Icons.add, ""),
    BottomModel(Icons.person, ""),
    BottomModel(Icons.notifications, " "),
  ];
  static const preloader =
      Center(child: CircularProgressIndicator(color: Colors.orange));
}

class BottomModel {
  IconData iconData;
  String label;

  BottomModel(this.iconData, this.label);
}
