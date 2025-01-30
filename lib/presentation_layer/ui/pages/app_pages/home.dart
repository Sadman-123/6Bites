import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/campaign_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/category_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_navbar.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_textfield.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/popular_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/restaurant_card.dart';
class Home extends StatelessWidget {
  HomeController home=Get.find();
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return Obx((){
      if(!home.isLoaded.value)
        {
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF030a45),
                rightDotColor: const Color(0xFF029c55),
                size: mdw*0.12,
              ),
            ),
          );
        }
      else{
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
                            Text("View All",style: TextStyle(fontSize: mdw*0.044,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563),fontWeight: FontWeight.bold),)
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
              SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("Popular Food Nearby",style: TextStyle(fontSize: mdw*0.057,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
                              Text("View All",style: TextStyle(fontSize: mdw*0.044,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563),fontWeight: FontWeight.bold),)
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child:Obx((){
                              return Row(
                                children:List.generate(home.popular_list.length, (index) {
                                  return PopularCard(mdw, mdh, "${home.popular_list[index]['image_full_url']}", "${home.popular_list[index]['name']}", "${home.popular_list[index]['restaurant_name']}", home.popular_list[index]['price'], double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)));
                                },),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Food Campaign",style: TextStyle(fontSize: mdw*0.057,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
                            Text("View All",style: TextStyle(fontSize: mdw*0.044,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563),fontWeight: FontWeight.bold),)
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child:Obx((){
                            return Row(
                              children:List.generate(home.campaign_list.length, (index) {
                                // return CampaignCard(mdw, mdh, "${home.popular_list[index]['image_full_url']}", "${home.popular_list[index]['name']}", "${home.popular_list[index]['restaurant_name']}", home.popular_list[index]['price'], double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)));
                                return CampaignCard(mdw, mdh, "${home.campaign_list[index]['image_full_url']}", "${home.campaign_list[index]['name']}", "${home.campaign_list[index]['restaurant_name']}", "${home.popular_list[index]['price']}",  "${home.popular_list[index]['discount']}","${home.popular_list[index]['rating_count']}" );
                              },),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
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
                                fontSize: mdw * 0.057,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF010742),
                              ),
                            ),
                            Icon(
                              Icons.filter_list,
                              size: mdw * 0.057,
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
                              return RestaurantCard(mdw, mdh, "${home.restaurant_list[index]['logo_full_url']}", "${home.restaurant_list[index]['name']}", "${home.restaurant_list[index]['address']}", "${home.restaurant_list[index]['reviews_comments_count']}","${home.restaurant_list[index]['avg_rating']}");
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
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomNavbar(mdw: mdw, mdh: mdh),
        );
      }
    });
  }
}