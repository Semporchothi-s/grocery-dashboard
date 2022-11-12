import 'package:flutter/material.dart';
import 'package:grocery_dashboard/themes/colors/colors.dart';
import 'package:grocery_dashboard/themes/text_styles.dart';

class Header extends StatelessWidget {
  final String title;
  final List<Widget> children;
  Header({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(color: ConstColor.primary, boxShadow: [
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
          Text(
            title,
            style: TxtStyle.primary(),
            textScaleFactor: 1.5,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: children,
          )
        ],
      ),
    );
  }
}
