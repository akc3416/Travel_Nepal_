import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/ATM/armlistscreen.dart';
import 'package:travel_nepal/src/modules/menu/widgets/ATM/custom_atm_widget.dart';

class ATMScreen extends StatelessWidget {
  final String title;
  const ATMScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        ATMListScreen(),
      ],
    );
  }
}
