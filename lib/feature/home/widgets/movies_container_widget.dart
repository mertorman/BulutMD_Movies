import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_frontend_app/feature/home/model/movies_model.dart';
import 'package:netflix_frontend_app/feature/movie_details/view/movie_details_view.dart';

class MoviesContainer extends StatelessWidget {
  MoviesContainer(
      {super.key,
      required this.title,
      required this.movies,
      required this.color,
      required this.color2,
      required this.index,
      required this.length});
  String title;
  List<MoviesModel> movies;
  Color color;
  Color color2;
  int index;
  int length;
  @override
  Widget build(BuildContext context) {
    List<int> diziIndex = [];
    List<int> filmIndex = [];
    movies.asMap().forEach((index, value) {
      if (value.category == 'Dizi') {
        diziIndex.add(index);
      } else {
        filmIndex.add(index);
      }
    });
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Material(
        color: color2,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 5,
          ),
          Text(title,
              style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider.builder(
              itemCount: length,
              itemBuilder: (context, index, realIndex) {
                if (this.index == 0 && movies[index].category == 'Dizi') {
                  return InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Movie_Details(),
                          ));
                    
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(80),
                            child: Image.asset(
                                movies[diziIndex[index]].movieImages,
                                fit: BoxFit.fill))),
                  );
                } else if (this.index == 1) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Movie_Details(),
                          ));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(80),
                            child: Image.asset(
                                movies[filmIndex[index]].movieImages,
                                fit: BoxFit.fill))),
                  );
                } else {
                  return SizedBox.shrink();
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
