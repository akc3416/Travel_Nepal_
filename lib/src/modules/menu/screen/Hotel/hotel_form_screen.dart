import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel_nepal/src/core/widget/SnakeBarWidget.dart';
import 'package:travel_nepal/src/shared/Constants.dart';
import 'package:travel_nepal/src/shared/preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelFormScreen extends StatefulWidget {
  final String hemail;
  HotelFormScreen({Key? key, required this.hemail}) : super(key: key);

  @override
  _HotelFormScreenState createState() => _HotelFormScreenState();
}

class _HotelFormScreenState extends State<HotelFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool dropdown = false;

  //Text Field state
  String _name = "";
  String _country = "";
  String _contactno = "";
  String _noofpeople = "";
  String _days = "";
  String _id = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Now"),
      ),
      body: _body(context),
    );
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
            decoration: textInputDecoration.copyWith(labelText: "Country"),
            validator: (val) =>
                val!.isEmpty ? "Enter Your Country Name." : null,
            onChanged: (val) {
              setState(() => _country = val);
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
            style: TextStyle(color: Colors.black),
            decoration:
                textInputDecoration.copyWith(labelText: "No. of People"),
            validator: (val) => val!.isEmpty ? "Enter No. of People." : null,
            onChanged: (val) {
              setState(() => _noofpeople = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "Days"),
            validator: (val) =>
                val!.isEmpty ? "No. of Days you want to stay." : null,
            onChanged: (val) {
              setState(() => _days = val);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: textInputDecoration.copyWith(labelText: "ID"),
            validator: (val) => val!.isEmpty ? "Enter Your ID" : null,
            onChanged: (val) {
              setState(() => _id = val);
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
                      subject: "Booking Hotel",
                      body: "Name: " +
                          _name +
                          "%0d%0a" +
                          "Country: " +
                          _country +
                          "%0d%0a" +
                          "Contact No.: " +
                          "%0d%0a" +
                          _contactno +
                          "%0d%0a" +
                          "No of People: " +
                          "%0d%0a" +
                          _noofpeople +
                          "%0d%0a" +
                          "Days :" +
                          "%0d%0a" +
                          _days +
                          "%0d%0a" +
                          "ID: " +
                          "%0d%0a" +
                          _id,
                    );
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
      _country = "";
      _contactno = "";
      _noofpeople = "";
      _days = "";
      _id = "";
      setState(() => loading = false);
    } else {
      setState(() => loading = false);
      throw 'Could not launch $_url';
    }
  }
}
