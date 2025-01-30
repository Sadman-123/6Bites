import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_campaign_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/web_related/web_category_card.dart';
import '../../Diy_components/web_related/web_popular_card.dart';
class HomeWeb extends StatelessWidget {
  HomeController home=Get.find();
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Row(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text("LOGO",style: TextStyle(fontSize: mdw*0.02),),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              ListTile(title: Text("Home",style: TextStyle(fontSize: mdw*0.011),),leading: FaIcon(FontAwesomeIcons.house,color: Color(0xFF88a5bc),size: mdw*0.014,),onTap: (){},),
                              Divider(),
                              ListTile(title: Text("Favourites",style: TextStyle(fontSize: mdw*0.011),),leading: FaIcon(FontAwesomeIcons.heart,color: Color(0xFF88a5bc),size: mdw*0.014,),onTap: (){},),
                              Divider(),
                              ListTile(title: Text("Billing",style: TextStyle(fontSize: mdw*0.011),),leading: FaIcon(FontAwesomeIcons.filePen,color: Color(0xFF88a5bc),size: mdw*0.014,),onTap: (){},),
                              Divider(),
                              ListTile(title: Text("About Us",style: TextStyle(fontSize: mdw*0.011),),leading: FaIcon(FontAwesomeIcons.info,color: Color(0xFF88a5bc),size: mdw*0.014,),onTap: (){},),
                            ],
                          )
                          ),
                        )
                  ],
                ),
              )),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.home_filled,size: mdw*0.017,color: Color(0xFFcdcdcd),),
                                      SizedBox(width: mdw*0.0025),
                                      Text("Mirpur,Dhaka,Bangladesh",style: TextStyle(fontSize: mdw*0.013,color: Color(0xFFcdcdcd)),)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        FaIcon(FontAwesomeIcons.solidBell, color: Color(0xFF000101), size: mdw * 0.017),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            width: mdw * 0.008,
                                            height: mdw * 0.008,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: mdw*0.014,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: mdw*0.334,
                            child:Container(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFfffefe),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.09),
                                      spreadRadius: 0.5,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 0.6,
                                      blurRadius: 8,
                                      offset: Offset(4, 0),
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 0.6,
                                      blurRadius: 8,
                                      offset: Offset(-4, 0),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(CupertinoIcons.search),
                                    hintText: "Search food or restaurant here..",
                                    filled: true,
                                    fillColor: Colors.transparent, // Important to keep the same color as the container
                                    hintStyle: TextStyle(
                                      color: Color(0xFFacacad),
                                      fontSize: mdw * 0.012,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ) ,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child:  Obx(() {
                              return Container(
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      items: List.generate(home.banner_list.length, (index) {
                                        return Container(
                                          width: mdw*0.46,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage("${home.banner_list[index]['image_full_url']}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }),
                                      options: CarouselOptions(
                                        height: mdh * 0.385,
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 16 / 8,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enableInfiniteScroll: true,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        viewportFraction: 0.5,
                                        onPageChanged: (index, reason) {
                                          home.currentIndex.value = index;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: mdh*0.029),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(home.banner_list.length, (index) {
                                        return Container(
                                          width: mdw*0.015,
                                          height: mdh*0.015,
                                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index==home.currentIndex.value ? Color(0xFF029c55) : Colors.grey,
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          Container(
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
                          ),
                          Container(
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
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text("Food Campaign",style: TextStyle(fontSize: mdw*0.022,fontWeight: FontWeight.bold,color: Color(0xFF010742)),),
                                      Text("View All",style: TextStyle(fontSize: mdw*0.015,color: Color(0xFF18a563),decoration: TextDecoration.underline,decorationColor: Color(0xFF18a563),fontWeight: FontWeight.bold),)
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
                                          return WebCampaignCard(mdw, mdh, "${home.campaign_list[index]['image_full_url']}", "${home.campaign_list[index]['name']}", "${home.campaign_list[index]['restaurant_name']}", "${home.popular_list[index]['price']}",  "${home.popular_list[index]['discount']}","${home.popular_list[index]['rating_count']}" );
                                        },),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF029c55),
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )),
    );
  }
}
