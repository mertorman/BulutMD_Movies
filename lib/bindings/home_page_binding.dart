import 'package:get/get.dart';
import 'package:netflix_frontend_app/feature/home/controller/home_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),permanent: true);
  }
}
