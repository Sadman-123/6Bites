import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_custom_appbar.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_custom_textfield.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web_components/web_all_restaurants_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web_components/web_banner_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web_components/web_category_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web_components/web_food_campaign_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/web_pages/home_web_components/web_popular_food_section.dart';
import '../../Diy_components/web_related/web_campaign_card.dart';
import '../../Diy_components/web_related/web_category_card.dart';
import '../../Diy_components/web_related/web_popular_card.dart';
class HomeWeb extends StatelessWidget{
  final double mdw;
  final double mdh;
  HomeController home=Get.find();
  HomeWeb(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            WebCustomAppbar(mdw, mdh),
            WebCustomTextfield(mdw, mdh),
            WebBannerSection(mdw, mdh),
            WebCategorySection(mdw, mdh),
            WebPopularFoodSection(mdw, mdh),
            WebFoodCampaignSection(mdw, mdh),
            WebAllRestaurantsSection(mdw, mdh)
          ],
        ),
      ),
    );
  }
}
