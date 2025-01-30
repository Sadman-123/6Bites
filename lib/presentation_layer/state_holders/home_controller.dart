import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sixbites/data_layer/api_urls.dart';
class HomeController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    getCategories();
    getPopular();
    getCampaign();
    getRestaurants();
  }
  RxList<dynamic> category_list=[].obs;
  RxList<dynamic> popular_list=[].obs;
  RxList<dynamic> campaign_list=[].obs;
  RxList<dynamic> restaurant_list=[].obs;
  Future<void>getCategories()async
  {
    var url=Uri.parse(ApiUrls.Category_List);
    var res=await http.get(url,headers: {
      'Content-Type':'application/json',
      'zoneId':'[1]',
      'latitude':'23.735129',
      'longitude':'90.425614'
    });
    if(res.statusCode==200)
      {
        category_list.value=jsonDecode(res.body);
      }
  }
  Future<void>getPopular()async
  {
    var url=Uri.parse(ApiUrls.Popular_List);
    var res=await http.get(url,headers: {
      'Content-Type':'application/json',
      'zoneId':'[1]',
      'latitude':'23.735129',
      'longitude':'90.425614'
    });
    if(res.statusCode==200)
    {
      popular_list.value=jsonDecode(res.body)['products'];
    }
  }
  Future<void>getCampaign()async
  {
    var url=Uri.parse(ApiUrls.Campaign_List);
    var res=await http.get(url,headers: {
      'Content-Type':'application/json',
      'zoneId':'[1]',
      'latitude':'23.735129',
      'longitude':'90.425614'
    });
    if(res.statusCode==200)
    {
      campaign_list.value=jsonDecode(res.body);
    }
  }
  Future<void>getRestaurants()async
  {
    var url=Uri.parse(ApiUrls.Restaurant_List);
    var res=await http.get(url,headers: {
      'Content-Type':'application/json',
      'zoneId':'[1]',
      'latitude':'23.735129',
      'longitude':'90.425614'
    });
    if(res.statusCode==200)
    {
      restaurant_list.value=jsonDecode(res.body)['restaurants'];
    }
  }
}