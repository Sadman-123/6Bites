import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget CustomTextfield(double mdw,double mdh) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFFfffefe),
        borderRadius: BorderRadius.circular(10),
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
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          suffixIcon: Icon(CupertinoIcons.search),
          hintText: "Search food or restaurant here..",
          filled: true,
          fillColor: Colors.transparent, // Important to keep the same color as the container
          hintStyle: TextStyle(
            color: Color(0xFFacacad),
            fontSize: mdw * 0.035,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}