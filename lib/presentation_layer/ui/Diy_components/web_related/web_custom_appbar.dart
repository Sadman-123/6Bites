import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget WebCustomAppbar(double mdw,double mdh) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.home_filled,size: mdw*0.017,color: Color(0xFFcdcdcd),),
              SizedBox(width: mdw*0.0025),
              Text("Mirpur,Dhaka,Bangladesh",style: TextStyle(fontSize: mdw*0.013,color: Color(0xFFcdcdcd)),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FaIcon(FontAwesomeIcons.solidBell, color: Color(0xFF000101), size: mdw * 0.017),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: mdw * 0.008,
                    height: mdw * 0.008,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: mdw*0.014,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}