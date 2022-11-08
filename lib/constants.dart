import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String baseurl = "http://16.7.98.2:8080/";
// String baseurl = "https://fs-grocery-db.herokuapp.com/";

Future toast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      backgroundColor: (Colors.grey[400]),
      webBgColor: "linear-gradient(to right,#404040, #404040)",
      webPosition: "center",
    );
  }