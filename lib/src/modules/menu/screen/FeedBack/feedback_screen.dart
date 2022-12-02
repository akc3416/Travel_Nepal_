import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel_nepal/src/core/widget/SnakeBarWidget.dart';
import 'package:travel_nepal/src/shared/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBackScreen extends StatefulWidget {
  final String hemail;
  FeedBackScreen({Key? key, required this.hemail}) : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dropdown = false;

  //Text Field state
  String _name = "";
  String _address = "";
  String _contactno = "";
  String _feedback = "";

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Card(
              elevation: 5.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: loading != true
                    ? _book(context)
                    : Center(
                        child: SpinKitRotatingPlain(
                          color: Colors.blue,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _book(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "Name"),
            validator: (val) => val!.isEmpty ? "Enter Your Name." : null,
            onChanged: (val) {
              setState(() => _name = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "Address"),
            validator: (val) => val!.isEmpty ? "Enter Your Address." : null,
            onChanged: (val) {
              setState(() => _address = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "Contact No."),
            validator: (val) => val!.isEmpty ? "Enter Your Contact No." : null,
            onChanged: (val) {
              setState(() => _contactno = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            maxLines: 4,
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "FeedBack"),
            validator: (val) => val!.isEmpty ? "Enter FeedBack." : null,
            onChanged: (val) {
              setState(() => _feedback = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: MaterialButton(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.send,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() => loading = true);
                  if (widget.hemail == "") {
                    CustomSnackBarWidget(customcontext: context)
                        .show("Unable to Send Message!");
                    print("Email Fail to Send");
                    setState(() => loading = false);
                  } else {
                    _sendingMails(
                        context: context,
                        to: widget.hemail,
                        subject: "FeedBack",
                        body: "Name: " +
                            _name +
                            "%0d%0a" +
                            "Contact No.: " +
                            "%0d%0a" +
                            _contactno +
                            "%0d%0a" +
                            "Address : " +
                            "%0d%0a" +
                            _address +
                            "%0d%0a" +
                            "FeedBack : " +
                            "%0d%0a" +
                            _feedback);
                    print("Email Sended");
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _sendingMails(
      {BuildContext? context,
      String? to,
      String? subject,
      String? body}) async {
    String _url = "mailto:$to?subject=$subject&body=$body";
    if (await canLaunch(_url)) {
      await launch(_url);
      _name = "";
      _contactno = "";
      _address = "";
      _feedback = "";
      setState(() => loading = false);
    } else {
      setState(() => loading = false);
      throw 'Could not launch $_url';
    }
  }
}
