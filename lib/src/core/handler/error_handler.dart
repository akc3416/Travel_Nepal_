import 'package:flutter/material.dart';

class RouteError extends StatelessWidget {
  const RouteError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Route Error",
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text("This is Error in Route Handler"),
      ),
    );
  }
}
