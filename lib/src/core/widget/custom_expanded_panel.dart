import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpandedPanel extends StatefulWidget {
  final List<Widget> header;
  final List<Widget> body;
  final int duration;
  final int elevation;
  CustomExpandedPanel(
      {required this.header,
      required this.body,
      this.duration = 1,
      this.elevation = 0});

  @override
  _CustomExpandedPanelState createState() => _CustomExpandedPanelState();
}

class _CustomExpandedPanelState extends State<CustomExpandedPanel> {
  List<bool> _isExpanded = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.header.length; i++) {
      _isExpanded.add(false);
    }
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 10, left: 5, right: 5),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.header.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionPanelList(
            elevation: widget.elevation.toDouble(),
            animationDuration: Duration(
              seconds: widget.duration,
            ),
            dividerColor: Colors.red,
            expandedHeaderPadding: EdgeInsets.all(0.0),
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                      width: ScreenUtil().screenWidth,
                      padding: EdgeInsets.all(10),
                      child: widget.header[index]);
                },
                body: Container(
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.all(10),
                    child: widget.body[index]),
                isExpanded: _isExpanded[index],
                canTapOnHeader: true,
              ),
            ],
            expansionCallback: (int item, bool status) {
              for (var i = 0; i < widget.header.length; i++) {
                if (i != index) {
                  setState(() {
                    _isExpanded[i] = false;
                  });
                }
              }
              setState(() {
                _isExpanded[index] = !_isExpanded[index];
              });
            },
          );
        },
      ),
    );
  }
}

class IsExpandedModel {
  bool isExpanded = false;

  IsExpandedModel({required this.isExpanded});
}
