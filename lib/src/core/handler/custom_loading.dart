import 'package:flutter/material.dart';

class CUstomLoading extends StatelessWidget {
  const CUstomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Text("Loading"),
      ),
    );
  }
}
