import 'package:get/get.dart';
import 'package:netflix_frontend_app/bindings/home_page_binding.dart';
import 'package:netflix_frontend_app/bindings/movies_details_page_binding.dart';
import 'package:netflix_frontend_app/feature/home/view/homepage_view.dart';
import 'package:netflix_frontend_app/feature/movie_details/view/movie_details_view.dart';

class AppRoutes {
  // Uygulama içerisinde ki rotalar state management yöntemi olan GetX ile tanımlandı.
  static final routes = [
    GetPage(name: '/home', page: () => const HomePage(), binding: HomePageBinding()),
    GetPage(name: '/moviedetails', page: () => const Movie_Details(),binding: MoviesPageBinding())
  ];
}
