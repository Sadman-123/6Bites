import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/ui/home.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home(),)
      ],
    );
  }
}