import 'package:flutter/material.dart';

class MenuCardWidget extends StatefulWidget {
  final String path;
  final String name;
  final VoidCallback onCardSelected;
  MenuCardWidget(
      {required this.path,
      this.name = "No Name",
      required this.onCardSelected});

  @override
  _MenuCardWidgetState createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: () => widget.onCardSelected(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image(
                  // height: 110.h,
                  image: AssetImage(widget.path),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
