import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
class WebBannerSection extends StatelessWidget{
  final double mdw;
  final double mdh;
  WebBannerSection(this.mdw,this.mdh);
  HomeController home=Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}