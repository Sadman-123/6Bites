import 'package:flutter/material.dart';
Widget CategoryCard(double mdw,double mdh,String picurl,String name) {
  return Container(
    margin: EdgeInsets.all(8),
    child: Column(
      children: [
        Container(
          height: mdh*0.09,
          width: mdw*0.21,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  spreadRadius: 0.5,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0.6,
                  blurRadius: 8,
                  offset: Offset(4, 0),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0.6,
                  blurRadius: 8,
                  offset: Offset(-4, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage("$picurl"),fit: BoxFit.cover)),
        ),
        SizedBox(height: mdh*0.009,),
        Container(child: Text("$name",style: TextStyle(fontSize: mdw*0.041,color: Color(0xFF0e164f)),),)
      ],
    ),
  );
}