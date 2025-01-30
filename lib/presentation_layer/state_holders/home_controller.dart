import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sixbites/data_layer/api_urls.dart';

class HomeController extends GetxController {
  RxList<dynamic> category_list = <dynamic>[].obs;
  RxList<dynamic> popular_list = <dynamic>[].obs;
  RxList<dynamic> campaign_list = <dynamic>[].obs;
  RxList<dynamic> restaurant_list = <dynamic>[].obs;
  RxBool isLoaded = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }
  void fetchInitialData() async {
    isLoaded.value = false;
    await Future.wait([
      getCategories(),
      getPopular(),
      getCampaign(),
      getRestaurants(),
    ]);
    isLoaded.value = true;
  }
  Future<void> getCategories() async {
    await _fetchData(
      url: ApiUrls.Category_List,
      list: category_list,
    );
  }
  Future<void> getPopular() async {
    await _fetchData(
      url: ApiUrls.Popular_List,
      list: popular_list,
      dataKey: 'products',
    );
  }
  Future<void> getCampaign() async {
    await _fetchData(
      url: ApiUrls.Campaign_List,
      list: campaign_list,
    );
  }
  Future<void> getRestaurants() async {
    await _fetchData(
      url: ApiUrls.Restaurant_List,
      list: restaurant_list,
      dataKey: 'restaurants',
    );
  }
  Future<void> _fetchData({
    required String url,
    required RxList<dynamic> list,
    String? dataKey,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _MyHeaders(),
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        list.value = dataKey != null ? decodedData[dataKey] : decodedData;
      } else {
        print('Failed to load data from $url: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data from $url: $e');
    }
  }
  Map<String, String> _MyHeaders() {
    return {
      'Content-Type': 'application/json',
      'zoneId': '[1]',
      'latitude': '23.735129',
      'longitude': '90.425614',
    };
  }
}