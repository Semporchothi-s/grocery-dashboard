import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grocery_dashboard/models/order_m.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Services {
  Dio dio = Dio();

  login(String url, String mobile, String password) async {
    try {
      return await dio.post(url, data: {
        "mobile": mobile,
        "password": password,
      });
    } on DioError catch (err) {
      toast(err.toString());
    }
  }

  // signin(String url, User data) async {
  //   try {
  //     return await dio.post(url, data: data);
  //   } on DioError catch (err) {
  //     toast(err.toString());
  //   }
  // }

 static orders(String url) async {
    var uri = Uri.parse(baseurl + url);
    final http.Response response =
        await http.get(uri, headers: <String, String>{
      'Content-Type': "application/json",
    });

    if (response.statusCode == 200 || response.statusCode == 304) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Orderitems> orderList = jsonItems.map<Orderitems>((json) {
        return Orderitems.fromJson(json);
      }).toList();
      return orderList;
    } else {
      // throw HttpStatus.expectationFailed;
    }
  }

  static currentorder(String url) async {
    var uri = Uri.parse(baseurl + url);
    final http.Response response =
        await http.get(uri, headers: <String, String>{
      'Content-Type': "application/json",
    });

    if (response.statusCode == 200 || response.statusCode == 304) {
      Orderitems orderdetail = ordersFromJson(response.body);
      return orderdetail;
    } else {
      // throw HttpStatus.expectationFailed;
    }
  }

  orderpacked(String url) async {
    try {
      return await dio.post(url, data: {
       "taken_by" : "nodejs",
       "status" : "Delivered"
      });
    } on DioError catch (err) {
      toast(err.toString());
    }
  }
}
