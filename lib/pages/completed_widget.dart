import 'package:flutter/material.dart';
import 'package:grocery_dashboard/models/order_m.dart';
import 'package:grocery_dashboard/services/services.dart';
import 'package:hovering/hovering.dart';

import '../constants.dart';

class Completedwgt extends StatefulWidget {
  @override
  _CompletedwgtState createState() => _CompletedwgtState();
}

class _CompletedwgtState extends State<Completedwgt> {
  Services service = Services();
  List<Orderitems> _orders = [Orderitems()];

  void initState() {
    super.initState();
    _getuser();
  }

  _getuser() async {
    await Services.orders("orders/completed").then((orderList) {
      setState(() {
        _orders = orderList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 600,
          width: 450,
          child: _orderlist(context),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 500,
          width: 1,
          color: Colors.black.withOpacity(0.4),
        ),
        Container(
          height: 600,
          width: 800,
          // color: Colors.blue,
        )
      ],
    ));
  }

  Widget _orderlist(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()
      ),
      children: _orders
          .map(
            (ordersits) => HoverAnimatedContainer(
              duration: Duration(milliseconds: 200),
              cursor: SystemMouseCursors.click,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      // offset: Offset(5, 13),

                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]),
              hoverDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      // offset: Offset(10, 25),
                      spreadRadius: 9,
                      blurRadius: 30,
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "Order ID : 15222332",
                          ordersits.id,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              // fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: "balsam",
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          // "Name : Sempor",
                          "Amount: ${ordersits.total}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              // fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: "balsam",
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          // "Qty: 5",
                          "Products: ${ordersits.product.length.toString()}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              // fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: "balsam",
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          // "Pending...",
                          ordersits.status,
                          style: TextStyle(
                              color: Colors.greenAccent[400],
                              // fontSize: 12,
                              fontWeight: FontWeight.w900,
                              fontFamily: "balsam",
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey[700],
                    size: 27,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
