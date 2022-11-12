import 'package:flutter/material.dart';
import 'package:grocery_dashboard/constants/constants.dart';
import 'package:grocery_dashboard/responsive/responsive.dart';
import 'package:grocery_dashboard/screens/orders_pg.dart';
import 'package:grocery_dashboard/screens/product_pg.dart';
import 'package:grocery_dashboard/themes/colors/colors.dart';
import 'package:grocery_dashboard/themes/text_styles.dart';

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
  double _height = 0;
  double _width = 0;
  @override
  Widget build(BuildContext context) {
    _height = Responsive.height(context);
    _width = Responsive.width(context);
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _height,
              width: _width * 0.12,
              decoration: BoxDecoration(
                color: WidgetColor.blackContainer,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 110,
                    child: Text(
                      ConstString.logo,
                      style: TxtStyle.logo(isWhite: true),
                      textScaleFactor: 1.1,
                    ),
                  ),
                  SizedBox(height: 80),
                  _menus(Label.orders, 0),
                  _menus(Label.Products, 1),
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

  Widget _menus(String label, int currentindex) {
    bool _ishover = false;
    return GestureDetector(
      onTap: () {
        setState(() {
          index = currentindex;
        });
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
           _ishover = true;
          });
        },
        onExit: (event) {
          setState(() {
            setState(() {
            _ishover = false;
            });
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: _ishover ? ConstColor.white : Colors.transparent,
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 4,
                decoration: BoxDecoration(
                    color: index == currentindex
                        ? ConstColor.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                label,
                style: TxtStyle.menu(isWhite: index == currentindex),
                textScaleFactor: 1.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
