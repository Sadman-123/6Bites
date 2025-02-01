import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';

import '../../../Diy_components/web_related/web_popular_card.dart';
class WebPopularFoodSection extends StatelessWidget{
  final double mdw;
  final double mdh;
  HomeController home=Get.find();
  WebPopularFoodSection(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Column(
        children: [
          Container(
            child: Row(
              children: [
                Text("Popular Food Nearby",style: TextStyle(fontSize: mdw*0.022,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
                Text("View All",style: TextStyle(fontSize: mdw*0.015,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563),fontWeight: FontWeight.bold),)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child:Obx((){
                  return Row(
                    children:List.generate(home.popular_list.length, (index) {
                      return WebPopularCard(mdw, mdh, "${home.popular_list[index]['image_full_url']}", "${home.popular_list[index]['name']}", "${home.popular_list[index]['restaurant_name']}", home.popular_list[index]['price'], double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)));
                    },),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}