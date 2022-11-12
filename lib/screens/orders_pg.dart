import 'package:flutter/material.dart';
import 'package:grocery_dashboard/constants/constants.dart';
import 'package:grocery_dashboard/pages/completed_widget.dart';
import 'package:grocery_dashboard/pages/pending_widget.dart';
import 'package:grocery_dashboard/themes/text_styles.dart';
import 'package:grocery_dashboard/widgets/header.dart';

class Orderspg extends StatefulWidget {
  @override
  _OrderspgState createState() => _OrderspgState();
}

class _OrderspgState extends State<Orderspg> {
  int index = 0;
  List<String> options = ["Pending", "Completed"];
  List wgt = [
    Pendingwgt(),
    Completedwgt(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: Label.orders, 
          children: options.map((_option) => _options(_option, options.indexOf(_option))).toList()
          ),
          Expanded(
            child: Container(
              child: wgt[index],
            ),
          )
        ],
      ),
    );
  }

  Widget _options(String label, int currentindex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = currentindex;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: index == currentindex ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TxtStyle.bold(isWhite: index == currentindex)
          .copyWith(letterSpacing: 1),
          textScaleFactor: 0.9,
        ),
      ),
    );
  }
}
