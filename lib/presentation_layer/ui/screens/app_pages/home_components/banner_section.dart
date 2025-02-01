import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
class BannerSection extends StatelessWidget{
  final double mdw;
  final double mdh;
  HomeController home=Get.find();
  BannerSection({super.key, required this.mdw, required this.mdh});
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    return Container(
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
    );
  }
}