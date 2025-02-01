import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_appbar.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_textfield.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_components/all_restaurants_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_components/banner_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_components/category_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_components/food_campaign_section.dart';
import 'package:sixbites/presentation_layer/ui/screens/app_pages/home_components/popular_food_section.dart';
class Home extends StatelessWidget {
  HomeController home=Get.find();
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppbar(mdw: mdw),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextfield(mdw, mdh),
                BannerSection(mdw: mdw, mdh: mdh),
                CategorySection(mdw, mdh),
                PopularFoodSection(mdw, mdh),
                FoodCampaignSection(mdw, mdh),
                AllRestaurantsSection(mdw, mdh),
              ],
            ),
          ),
        ],
      ),
    );
  }
}