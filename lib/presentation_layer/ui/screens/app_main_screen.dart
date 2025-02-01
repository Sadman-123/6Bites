import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/styles/app_colors.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/cart_app.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/favourite_app.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_app.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/menu_app.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/order_app.dart';
class AppMainScreen extends StatelessWidget{
  HomeController home=Get.find();
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
   return  Obx((){
     if(!home.isLoaded.value){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white,),
          body: Center(
            child: LoadingAnimationWidget.twistingDots(
              leftDotColor: AppColors.secondaryColor,
              rightDotColor: AppColors.primaryColor,
              size: mdw*0.12,
            ),
          ),
        );
     }
     else{
       return PersistentTabView(
         context,
         navBarStyle: NavBarStyle.style15,
         screens: [
           Home(),
           FavouriteApp(),
           CartApp(),
           OrderApp(),
           MenuApp(),
         ],
         items: [
           _Navbaritem(mdw, FaIcon(FontAwesomeIcons.home)),
           _Navbaritem(mdw, FaIcon(FontAwesomeIcons.solidHeart)),
           _Navbaritem(mdw, FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,)),
           _Navbaritem(mdw, FaIcon(FontAwesomeIcons.receipt)),
           _Navbaritem(mdw, FaIcon(FontAwesomeIcons.bars)),
         ],
       );
     }
   });
  }
  PersistentBottomNavBarItem _Navbaritem(double mdw, FaIcon icon) {
    return PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.grey,
      iconSize: mdw*0.055,
    );
  }
}