import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/Transport/transport_list/transport_list_screen.dart';

class TransportScreen extends StatefulWidget {
  final String title;
  final int type;
  TransportScreen({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  _TransportScreenState createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return TransportListScreen(type: widget.type);
  }
}
