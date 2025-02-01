import 'package:flutter/material.dart';
class MenuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Menu App'),
        ),
      ),
    );
  }
}