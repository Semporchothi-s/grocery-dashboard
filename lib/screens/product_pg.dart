import 'package:flutter/material.dart';
import 'package:grocery_dashboard/themes/themes.dart';

import '../constants/constants.dart';
import '../widgets/widgets.dart';

class Productpg extends StatefulWidget {
  @override
  _ProductpgState createState() => _ProductpgState();
}

class _ProductpgState extends State<Productpg> {
  int index = 0;
  List<String> options = ["Categories", "Products"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: Label.Products, 
          children: options.map((_option) => _options(_option, options.indexOf(_option))).toList()),
           Expanded(
            child: Container(
              
            //  child : wgt[index],

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
            color: index == currentindex ? ConstColor.black : Colors.transparent,
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
