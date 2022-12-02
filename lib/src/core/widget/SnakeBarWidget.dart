import 'package:flutter/material.dart';

class CustomSnackBarWidget {
  final BuildContext customcontext;
  const CustomSnackBarWidget({required this.customcontext});
  void show(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(customcontext).showSnackBar(snackBar);
  }
}
