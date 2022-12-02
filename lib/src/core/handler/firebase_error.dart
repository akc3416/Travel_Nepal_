import 'package:flutter/material.dart';

class FirebaseErrorHandler extends StatelessWidget {
  final String msg;
  const FirebaseErrorHandler({Key? key, this.msg = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text("This is Error Handler"),
      ),
    );
  }
}
