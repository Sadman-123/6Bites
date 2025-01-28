import 'package:get/get.dart';
import 'package:sixbites/presentation_layer/state_holders/home_controller.dart';
class StateHoldersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
  }
}