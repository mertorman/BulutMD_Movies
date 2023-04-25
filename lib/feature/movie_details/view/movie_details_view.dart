import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_frontend_app/feature/home/controller/home_controller.dart';
import 'package:netflix_frontend_app/feature/home/model/model_movies.dart';
import 'package:netflix_frontend_app/feature/home/widgets/app_bar_widget.dart';
import 'package:netflix_frontend_app/feature/home/widgets/bottom_bar_widget.dart';
import 'package:netflix_frontend_app/feature/movie_details/controller/movie_details_controller.dart';

class Movie_Details extends StatefulWidget {
  const Movie_Details({super.key});

  @override
  State<Movie_Details> createState() => _Movie_DetailsState();
}

class _Movie_DetailsState extends State<Movie_Details> {
  HomeController homeController = Get.find();
  MovieDetailsController movieDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return movieDetailsController.obx(
        onLoading: Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        )), (state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar_Widget(),
        bottomNavigationBar: Bottom_Bar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                decoration:
                    BoxDecoration(color: Colors.grey.shade500.withOpacity(0.9)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Obx(
                        () => Text(homeController.baslik.value,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextField(
                    controller: movieDetailsController.searchQuery,
                    onTap: () {
                      movieDetailsController.handleSearchStart();
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: homeController.textFieldHintText.value,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      
                      title: Obx(
                        () => Text(movieDetailsController.defaultText.value,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 16)),
                      ),
                      children: [
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            movieDetailsController
                                .textChange('Yeniye Göre Sırala');
                            movieDetailsController
                                .listSort('Yeniye Göre Sırala');
                          },
                          child: Text(
                            "Yeniye Göre Sırala",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            movieDetailsController
                                .textChange('Eskiye Göre Sırala');
                            movieDetailsController
                                .listSort('Eskiye Göre Sırala');
                          },
                          child: Text("Eskiye Göre Sırala",
                              style: GoogleFonts.poppins(fontSize: 16)),
                        ),
                        Divider(color: Colors.black, thickness: 1),
                        InkWell(
                          onTap: () {
                            movieDetailsController
                                .textChange('Puana Göre Sırala');
                            movieDetailsController
                                .listSort('Puana Göre Sırala');
                          },
                          child: Text("Puana Göre Sırala",
                              style: GoogleFonts.poppins(fontSize: 16)),
                        ),
                        Divider(color: Colors.black, thickness: 1),
                        InkWell(
                          onTap: () {
                            movieDetailsController
                                .textChange('Rastgele Sırala');
                            movieDetailsController
                                .listSort('Rastgele Sırala');
                          },
                          child: Text("Rastgele Sırala",
                              style: GoogleFonts.poppins(fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Obx(
                  () => GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: movieDetailsController.searchList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox.fromSize(
                                    size: Size.fromRadius(80),
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w500' +
                                            movieDetailsController
                                                .searchList[index].imageUrl!,
                                        fit: BoxFit.fill))),
                            SizedBox(
                              height: 5,
                            ),
                            Flexible(
                              child: Container(
                                child: Text(
                                  movieDetailsController
                                      .searchList[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
