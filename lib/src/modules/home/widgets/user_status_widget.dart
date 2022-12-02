import 'package:flutter/material.dart';

class UserStatusWidget extends StatefulWidget {
  final BuildContext customContext;
  UserStatusWidget({Key? key, required this.customContext}) : super(key: key);

  @override
  _UserStatusWidgetState createState() => _UserStatusWidgetState();
}

class _UserStatusWidgetState extends State<UserStatusWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      Future.delayed(Duration(seconds: 0)).then((_) {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            builder: (BuildContext bc) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: new ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[SizedBox(height: 5)],
                ),
              );
            });
      });
      super.initState();
    }

    return Container();
  }
}

// showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title: Text("Alert"),
//                                         titleTextStyle: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black),
//                                         scrollable: true,
//                                         content: Text("Select Your Status!"),
//                                         actions: [
//                                           Row(
//                                             children: [
//                                               MaterialButton(
//                                                 child: Text(
//                                                   "Delete",
//                                                   style: TextStyle(
//                                                       color: Colors.black),
//                                                 ),
//                                                 onPressed: () async {
//                                                   Navigator.of(context).pop();
//                                                 },
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               MaterialButton(
//                                                 child: Text("Cancel"),
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       );
//                                     });