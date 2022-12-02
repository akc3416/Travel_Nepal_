import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.white),
  labelStyle: TextStyle(color: Colors.black),
  // fillColor: Colors.black45,
  // filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
);

const appBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(25),
  ),
);

const bottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
  ),
);

const buttonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
);

const containerShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)));

const dialogshape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)));
