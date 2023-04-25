import 'package:get/get.dart';
import 'package:netflix_frontend_app/feature/movie_details/controller/movie_details_controller.dart';

class MoviesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}
