import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_frontend_app/feature/home/controller/home_controller.dart';
import 'package:netflix_frontend_app/feature/movie_details/controller/movie_details_controller.dart';
import 'package:netflix_frontend_app/feature/movie_details/view/movie_details_view.dart';

class MoviesContainer extends StatelessWidget {
  MoviesContainer({
    super.key,
    required this.title,
    required this.color,
    required this.color2,
    required this.index,
  });
  String title;
  Color color;
  Color color2;
  int index;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Material(
        color: color2,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 5,
          ),
          Text(title,
              style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider.builder(
              itemCount: this.index == 0
                  ? homeController.trendTv.length
                  : homeController.trendMovies.length,
              itemBuilder: (context, index, realIndex) {
                if (this.index == 0) {
                  return InkWell(
                    onTap: () {
                      homeController.allTvMovies = homeController.trendTv;
                      homeController.baslik.value = 'Popüler Diziler';
                      homeController.textFieldHintText.value = 'Dizi ara';
                      Get.toNamed('/moviedetails');
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(80),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500' +
                                  homeController.trendTv[index].imageUrl!,
                            ))),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      homeController.allTvMovies = homeController.trendMovies;
                      homeController.baslik.value = 'Popüler Filmler';
                      homeController.textFieldHintText.value = 'Film ara';
                      Get.toNamed('/moviedetails');
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(80),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500' +
                                  homeController.trendMovies[index].imageUrl!,
                            ))),
                  );
                }
              },
              options: CarouselOptions(
                height: 180,
                aspectRatio: 16 / 9,
                viewportFraction: 0.35,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                onPageChanged: (index, reason) {},
              ),
            ),
          )
        ]),
      ),
    );
  }
}
