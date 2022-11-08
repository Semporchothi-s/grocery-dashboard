import 'package:flutter/material.dart';
import 'package:grocery_dashboard/constants.dart';
import 'package:grocery_dashboard/models/order_m.dart';
import 'package:grocery_dashboard/services/services.dart';
import 'package:hovering/hovering.dart';

class Pendingwgt extends StatefulWidget {
  @override
  _PendingwgtState createState() => _PendingwgtState();
}

class _PendingwgtState extends State<Pendingwgt> {
  Services service = Services();
  List<Orderitems> _orders = [Orderitems()];
  Orderitems details = Orderitems();
  String currentid = "";
  void initState() {
    super.initState();
    _getorderlist();
  }

  _getorderlist() async {
    await Services.orders("orders/pending").then((orderList) {
      setState(() {
        _orders = orderList;
      });
    });
  }

  _getorderdetail() async {
    await Services.currentorder("orders/$currentid").then((orderdetail) {
      setState(() {
        details = orderdetail;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 600,
              width: 800,

              child: _orderdetails(),
              // color: Colors.blue,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   height: 500,
            //   width: 1,
            //   color: Colors.black.withOpacity(0.4),
            // ),
            Spacer(),
            Container(
              // height: 600,
              width: 350,
              color: Colors.grey.shade100,
              child: _orderlist(),
            ),

          ],
        ));
  }

  Widget _orderlist() {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: _orders
          .map(
            (ordersits) => GestureDetector(
              onTap: () {
                setState(() {
                  currentid = ordersits.id;
                  _getorderdetail();
                });
              },
              child: HoverAnimatedContainer(
                duration: Duration(milliseconds: 200),
                cursor: SystemMouseCursors.click,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: Offset(0, 10),

                        // spreadRadius: 2,
                        blurRadius: 30,
                      )
                    ]),
                hoverDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: Offset(0, 15),
                        // spreadRadius: 9,
                        blurRadius: 30,
                      )
                    ]),
                child: Row(
                  children: [
                    
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: ordersits.id == currentid ?Colors.grey[700] : Colors.transparent,
                      size: 27,
                    ),
                    Spacer(),
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
                                color: Colors.red,
                                // fontSize: 12,
                                fontWeight: FontWeight.w900,
                                fontFamily: "balsam",
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _orderdetails() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RawMaterialButton(
                onPressed: () {
                  service.orderpacked(baseurl + "update/order/$currentid");
                  setState(() {
                  _getorderlist();
                    
                  });
                },
                fillColor: Colors.grey[300],
                hoverColor: Colors.grey[400],
                elevation: 0,
                hoverElevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Packed",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            // fontSize: 12,
                            fontWeight: FontWeight.w900,
                            fontFamily: "quicksand",
                            letterSpacing: 1),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              // IconButton(
              //   onPressed: _getorderdetail(), 
              //   icon: Icon(Icons.replay_rounded,
              //   color: Colors.black,
              //   size: 20,
              //   )
              //   ),
                SizedBox(
                width: 30,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Order ID : ${details.id}",
            style: TextStyle(
                color: Colors.black,
                // fontSize: 12,
                fontWeight: FontWeight.w800,
                // fontFamily: "quicksand",
                letterSpacing: 1),
            textScaleFactor: 1.2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Products",
            style: TextStyle(
                color: Colors.black,
                // fontSize: 12,
                fontWeight: FontWeight.w800,
                // fontFamily: "quicksand",
                letterSpacing: 1),
            textScaleFactor: 1.2,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              // physics: NeverScrollableScrollPhysics(),
              children: details.product
                  .map(
                    (pds) => Container(
                      child: Text(
                        pds.productname + "\t" + pds.qty + "\t" + pds.price,
                        style: TextStyle(
                            color: Colors.black,
                            // fontSize: 12,
                            fontWeight: FontWeight.w800,
                            // fontFamily: "quicksand",
                            letterSpacing: 1),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total : ${details.total}",
            style: TextStyle(
                color: Colors.black,
                // fontSize: 12,
                fontWeight: FontWeight.w800,
                // fontFamily: "quicksand",
                letterSpacing: 1.2),
          )
        ],
      ),
    );
  }
}
