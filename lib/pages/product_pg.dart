import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Productpg extends StatefulWidget {
  @override
  _ProductpgState createState() => _ProductpgState();
}

class _ProductpgState extends State<Productpg> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.amber,
               boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300.withOpacity(0.8),
                offset: Offset(5, 20),
                blurRadius: 10,
              ),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "   Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "quicksand",
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.1),
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _options("Categories", 0),
                    SizedBox(
                      width: 20,
                    ),
                    _options("Products", 1),
                  ],
                )
              ],
            ),
          ),
           Expanded(
            child: Container(
              
            //  child : wgt[index],

             ),
           )
         
        ],
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
      child: HoverAnimatedContainer(

          margin: EdgeInsets.only(left: 8),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          // hoverPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 21),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          cursor: SystemMouseCursors.click,
          decoration: BoxDecoration(
            color: index == currentindex ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            optionname,
            style: TextStyle(
        color: index == currentindex
            ? Colors.white
            : Colors.black.withOpacity(0.6),
        fontFamily: "balsam",
        fontWeight: FontWeight.w300,
        letterSpacing: 1.1),
            textScaleFactor: 0.9,
          ),
        ),
    );
  }
}
