import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/application_layer/app.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
void main()
{
  Get.lazyPut(()=>HomeController());
  runApp(App());
}