import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/campaign_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/category_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_textfield.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/popular_card.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/restaurant_card.dart';
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
            child: Obx(() {
              return Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: List.generate(home.banner_list.length, (index) {
                        return Container(
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
                        height: mdh * 0.145,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          home.currentIndex.value = index;
                        },
                      ),
                    ),
                    SizedBox(height: mdh*0.021),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(home.banner_list.length, (index) {
                        return Container(
                          width: mdw*0.02,
                          height: mdh*0.02,
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
                              return PopularCard(mdw, mdh, "${home.popular_list[index]['image_full_url']}", "${home.popular_list[index]['name']}", "${home.popular_list[index]['restaurant_name']}", home.popular_list[index]['price'], double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)),(){
                                showModalBottomSheet(context: context, builder: (context) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Expanded(flex: 3,
                                            child: SingleChildScrollView(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(flex: 3,child: Container(
                                                            child: Container(
                                                              height: mdh*0.15,
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                  image: NetworkImage("${home.popular_list[index]['image_full_url']}"),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                            ),
                                                            padding: EdgeInsets.all(10),
                                                          )),
                                                          Expanded(flex: 4,child: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  child: Text("${home.popular_list[index]['name']}",style: TextStyle(
                                                                      fontSize: mdw*0.057,
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.black
                                                                  ),),
                                                                ),
                                                                Container(
                                                                  child: Text("${home.popular_list[index]['restaurant_name']}",style: TextStyle(
                                                                      fontSize: mdw*0.043,
                                                                      color: Colors.black
                                                                  ),),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        child: RatingBarIndicator(
                                                                          rating: double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)),
                                                                          itemBuilder: (context, index) => Icon(
                                                                            Icons.star,
                                                                            color: Color(0xFF22a96b),
                                                                          ),
                                                                          itemCount: 5,
                                                                          itemSize: mdw*0.06,
                                                                          direction: Axis.horizontal,
                                                                        ),
                                                                      ),
                                                                      Text("(${home.popular_list[index]['reviews_count']})",style: TextStyle(
                                                                          fontSize: mdw*0.043,
                                                                          color: Colors.black
                                                                      ),)
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                          Expanded(child: Container(
                                                            child: Center(
                                                              child: Icon(Icons.favorite,color: Colors.white,size: mdw*0.057,),
                                                            ),
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text("Description",style: TextStyle(
                                                              fontSize: mdw*0.057,
                                                              fontWeight: FontWeight.bold
                                                          ),),
                                                          FaIcon(home.popular_list[index]['veg'] <=0? FontAwesomeIcons.leaf : FontAwesomeIcons.bacon,size: mdw*0.057,color: home.popular_list[index]['veg']<=0 ? Color(0xFF22a96b) : Color(0xFFe74c3c),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: EdgeInsets.all(10),
                                                      child: Text("${home.popular_list[index]['description']}",style: TextStyle(
                                                          fontSize: mdw*0.043,
                                                          color: Colors.black
                                                      ),),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Text("Additional",style: TextStyle(
                                                                fontSize: mdw*0.057,
                                                                fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                          Container(
                                                            //optional text as badge
                                                            child: Text("Optional",style: TextStyle(
                                                                color: Colors.white,
                                                                backgroundColor: Color(0xFF029c55),
                                                                fontSize: mdw*0.043,
                                                                fontWeight: FontWeight.bold
                                                            ),),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.all(10),
                                                        child: Container(
                                                          height: mdh*0.15,
                                                          color: Color(0xFFf5f5f5),
                                                          child: ListView.builder(
                                                            itemCount: home.popular_list[index]['add_ons'].length,
                                                            itemBuilder: (context, ind) {
                                                              return ListTile(
                                                                leading: Icon(Icons.add_circle_outline,color: Color(0xFF029c55),),
                                                                title: Text("${home.popular_list[index]['add_ons'][ind]['name']}",style: TextStyle(
                                                                    fontSize: mdw*0.043,
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold
                                                                ),),
                                                                trailing: Text("\$${home.popular_list[index]['add_ons'][ind]['price']}",style: TextStyle(
                                                                    fontSize: mdw*0.043,
                                                                    color: Colors.black
                                                                ),),
                                                              );
                                                            },
                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Expanded(child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text("Total Amount",style: TextStyle(
                                                        fontSize: mdw*0.057,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                    Text(
                                                      "\$${home.popular_list[index]['price']}",
                                                      style: TextStyle(
                                                        fontSize: mdw * 0.057,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    )

                                                  ],
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                ),
                                              ),
                                              SizedBox(height: mdh*0.015),
                                              Container(
                                                child: Container(
                                                  height: mdh*0.048,
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF029c55),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Center(
                                                    child: Text("Order Now",style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: mdw*0.047,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  );
                                },);
                              });
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
    );
  }
}