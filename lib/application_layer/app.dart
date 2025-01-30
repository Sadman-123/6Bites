import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/styles/app_themes.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/adaptive_helper.dart';
import 'package:sixbites/presentation_layer/ui/pages/app_pages/home_app.dart';
import 'package:sixbites/presentation_layer/ui/pages/web_pages/home_web.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return GetMaterialApp(
      title: "Stack Food",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.LightTheme(context, mdw, mdh),
      darkTheme: AppThemes.DarkTheme(context, mdw, mdh),
      themeMode: ThemeMode.light,
      home: AdaptiveHelper(App: Home(), Web: HomeWeb()),
    );
  }
}