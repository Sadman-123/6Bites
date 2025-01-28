import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/application_layer/state_holders_binding.dart';
import 'package:sixbites/presentation_layer/styles/app_themes.dart';
import 'package:sixbites/presentation_layer/ui/home.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return GetMaterialApp(
      title: "SixBites",
      debugShowCheckedModeBanner: false,
      initialBinding: StateHoldersBinding(),
      theme: AppThemes.LightTheme(context, mdw, mdh),
      darkTheme: AppThemes.DarkTheme(context, mdw, mdh),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home(),)
      ],
    );
  }
}