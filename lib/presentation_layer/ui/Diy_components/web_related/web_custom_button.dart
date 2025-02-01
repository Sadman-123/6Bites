import 'package:flutter/material.dart';
Widget WebCustomButton(double mdw,double mdh,String txt)
{
  return Container(
    width: mdw*0.25,
    height: mdh*0.081,
    decoration: BoxDecoration(
      color: Color(0xFF029c55),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text("$txt",style: TextStyle(color: Color(0xFFfdfeff),fontSize: mdw*0.014,fontWeight: FontWeight.bold),),
    ),
  );
}