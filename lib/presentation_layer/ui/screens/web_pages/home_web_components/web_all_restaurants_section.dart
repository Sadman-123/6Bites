import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_restaurant_card.dart';

import '../../../Diy_components/app_related/restaurant_card.dart';
class WebAllRestaurantsSection extends StatelessWidget{
  final double mdw;
  final double mdh;
  HomeController home=Get.find();
  WebAllRestaurantsSection(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Restaurants",
                  style: TextStyle(
                    fontSize: mdw * 0.022,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010742),
                  ),
                ),
                Icon(
                  Icons.filter_list,
                  size: mdw * 0.015,
                  color: Color(0xFF010742),
                )
              ],
            ),
          ),
          Container(
            child: Obx((){
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return WebRestaurantCard(mdw, mdh, "${home.restaurant_list[index]['logo_full_url']}", "${home.restaurant_list[index]['name']}", "${home.restaurant_list[index]['address']}", "${home.restaurant_list[index]['reviews_comments_count']}","${home.restaurant_list[index]['avg_rating']}");
                },
                separatorBuilder: (context, index) => Divider(
                  indent: mdw*0.3,
                  endIndent: mdw*0.03,
                ),
                itemCount: home.restaurant_list.length,
              );
            }),
          )
        ],
      ),
    );
  }
}