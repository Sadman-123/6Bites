import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';

import '../../../Diy_components/web_related/web_category_card.dart';
class WebCategorySection extends StatelessWidget{
  final double mdw;
  final double mdh;
  HomeController home=Get.find();
  WebCategorySection(this.mdw,this.mdh);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Column(
        children: [
          Container(
            child: Row(
              children: [
                Text("Categories",style: TextStyle(fontSize: mdw*0.022,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
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
                    children:List.generate(home.category_list.length, (index) {
                      return WebCategoryCard(mdw, mdh, "${home.category_list[index]['image_full_url']}", "${home.category_list[index]['name']}");
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
