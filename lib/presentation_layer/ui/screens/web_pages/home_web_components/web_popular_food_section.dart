import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      return WebPopularCard(mdw, mdh, "${home.popular_list[index]['image_full_url']}", "${home.popular_list[index]['name']}", "${home.popular_list[index]['restaurant_name']}", home.popular_list[index]['price'], double.parse(home.popular_list[index]['avg_rating'].toStringAsFixed(1)),() {
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
                                                              fontSize: mdw*0.014,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black
                                                          ),),
                                                        ),
                                                        Container(
                                                          child: Text("${home.popular_list[index]['restaurant_name']}",style: TextStyle(
                                                              fontSize: mdw*0.011,
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
                                                                  itemSize: mdw*0.011,
                                                                  direction: Axis.horizontal,
                                                                ),
                                                              ),
                                                              Text("(${home.popular_list[index]['reviews_count']})",style: TextStyle(
                                                                  fontSize: mdw*0.011,
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
                                                      child: Icon(Icons.favorite,color: Colors.pink,size: mdw*0.022,),
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
                                                      fontSize: mdw*0.014,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                  FaIcon(home.popular_list[index]['veg'] <=0? FontAwesomeIcons.leaf : FontAwesomeIcons.bacon,size: mdw*0.014,color: home.popular_list[index]['veg']<=0 ? Color(0xFF22a96b) : Color(0xFFe74c3c),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(10),
                                              child: Text("${home.popular_list[index]['description']}",style: TextStyle(
                                                  fontSize: mdw*0.013,
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
                                                        fontSize: mdw*0.014,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  ),
                                                  Container(
                                                    //optional text as badge
                                                    child: Text("Optional",style: TextStyle(
                                                        color: Colors.white,
                                                        backgroundColor: Color(0xFF029c55),
                                                        fontSize: mdw*0.014,
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
                                                            fontSize: mdw*0.014,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                        trailing: Text("\$${home.popular_list[index]['add_ons'][ind]['price']}",style: TextStyle(
                                                            fontSize: mdw*0.014,
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
                                                fontSize: mdw*0.014,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text(
                                              "\$${home.popular_list[index]['price']}",
                                              style: TextStyle(
                                                fontSize: mdw * 0.014,
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
                                                fontSize: mdw*0.011,
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
                      },);
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