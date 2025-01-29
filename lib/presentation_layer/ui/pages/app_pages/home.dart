import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/category_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_navbar.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_textfield.dart';
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
          SliverAppBar(
            pinned: false,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    FaIcon(FontAwesomeIcons.solidBell, color: Color(0xFF000101), size: mdw * 0.057),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: mdw * 0.025,
                        height: mdw * 0.025,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: mdw*0.003,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            title: Row(
              children: [
                Icon(Icons.home_filled,size: mdw*0.057,color: Color(0xFFcdcdcd),),
                SizedBox(width: mdw*0.011),
                Text("Mirpur,Dhaka,Bangladesh",style: TextStyle(fontSize: mdw*0.043,color: Color(0xFFcdcdcd)),)
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: CustomTextfield(mdw, mdh),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("Categories",style: TextStyle(fontSize: mdw*0.057,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
                        Text("View All",style: TextStyle(fontSize: mdw*0.044,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563)),)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child:Obx((){
                        return Row(
                          children:List.generate(home.category_list.length, (index) {
                            return CategoryCard(mdw, mdh, "${home.category_list[index]['image_full_url']}", "${home.category_list[index]['name']}");
                          },),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavbar(mdw: mdw, mdh: mdh),
    );
  }
}