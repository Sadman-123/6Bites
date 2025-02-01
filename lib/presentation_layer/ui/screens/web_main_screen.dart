import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/styles/app_colors.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/cart_web.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/favourite_web.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/menu_web.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/order_web.dart';

class WebMainScreen extends StatelessWidget {
  final HomeController home = Get.find();

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.sizeOf(context).width;
    var mdh = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Obx((){
        if(!home.isLoaded.value)
          {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(backgroundColor: Colors.white,),
              body: Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: AppColors.secondaryColor,
                  rightDotColor: AppColors.primaryColor,
                  size: mdw*0.065,
                ),
              ),
            );
          }
        else{
          return Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Flexible(
                          child: Center(
                            child: Image.network("https://stackfood-admin.6amtech.com/storage/app/public/business/2022-04-17-625c012c3c07d.png",width: mdw*0.15,),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              _buildNavItem(0, "Home", FontAwesomeIcons.house, mdw),
                              Divider(),
                              _buildNavItem(1, "Favourites", FontAwesomeIcons.solidHeart, mdw),
                              Divider(),
                              _buildNavItem(2, "My Orders", FontAwesomeIcons.receipt, mdw),
                              Divider(),
                              _buildNavItem(3, "Menu", FontAwesomeIcons.bars, mdw),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Obx(() => IndexedStack(
                    index: home.selectedIndex.value,
                    children: [
                      HomeWeb(mdw, mdh),
                      FavouriteWeb(mdw,mdh),
                      OrderWeb(mdw,mdh),
                      MenuWeb(mdw,mdh),
                      CartWeb(mdw,mdh),
                    ],
                  )),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xFF029c55),
              shape: CircleBorder(),
              onPressed: () {
                home.selectedIndex.value = 4;
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildNavItem(int index, String title, IconData icon, double mdw) {
    return Obx(() => ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: mdw * 0.011,
          color: home.selectedIndex.value == index ? AppColors.primaryColor : Colors.black,
        ),
      ),
      leading: FaIcon(
        icon,
        color: home.selectedIndex.value == index ? AppColors.primaryColor : Color(0xFF88a5bc),
        size: mdw * 0.014,
      ),
      onTap: () {
        home.selectedIndex.value = index;
      },
    ));
  }
}
