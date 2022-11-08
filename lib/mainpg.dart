import 'package:flutter/material.dart';
import 'package:grocery_dashboard/pages/orders_pg.dart';
import 'package:grocery_dashboard/pages/product_pg.dart';
import"package:hovering/hovering.dart";


class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int index = 0;
  List pages = [
    Orderspg(),
    Productpg(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.12,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    alignment: Alignment.center,
                    height: 110,
                    // color: Colors.amber,
                    child: Text(
                      "SEM Shoppy",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "quicksand",
                        fontWeight: FontWeight.w900,
                      ),
                      textScaleFactor: 1.1,
                    ),
                  ),
                  SizedBox(height: 80),
                  _options("Orders", 0),
                  SizedBox(
                    height: 10,
                  ),
                  _options("Products", 1),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.88,
              child: pages[index],
            )
          ],
        ),
      ),
    );
  }

  Widget _options(String optionname, int currentindex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = currentindex;
        });
      },
      child: HoverContainer(
        hoverColor: Colors.white.withOpacity(0.1),
        cursor: SystemMouseCursors.click,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              // height: double.infinity,
              height: 40,
              width: 4,
              decoration: BoxDecoration(
                color: index == currentindex ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
            ),
            SizedBox(width: 18,),
            Text(
              optionname,
              style: TextStyle(
                  color: index == currentindex ? Colors.white : Colors.white.withOpacity(0.5),
                  fontFamily: "nunito",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
              textScaleFactor: 1.05,
            ),
          ],
        ),
      ),
    );
  }
}
