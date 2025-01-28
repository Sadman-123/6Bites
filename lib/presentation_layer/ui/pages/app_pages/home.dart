import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    HomeController home=Get.find();
    return Scaffold(
      body: Center(child: Text("App"),),
    );
  }
}