import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_frontend_app/feature/home/model/movies_model.dart';
import 'package:netflix_frontend_app/feature/home/widgets/app_bar_widget.dart';
import 'package:netflix_frontend_app/feature/home/widgets/bottom_bar_widget.dart';
import 'package:netflix_frontend_app/feature/home/widgets/movies_container_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int diziSayac = 0;
    int filmSayac = 0;
    MoviesModels.movies.forEach(
      (element) {
        if (element.category == 'Dizi') {
          diziSayac++;
        } else {
          filmSayac++;
        }
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Bottom_Bar(),
      appBar: AppBar_Widget(),
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
                    child: Text('Popüler Başlıklar',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return MoviesContainer(
                        length: index == 0 ? diziSayac : filmSayac,
                        title: index == 0 ? 'Diziler' : 'Filmler',
                        movies: MoviesModels.movies,
                        color: index== 0 ? Color(0xFFc8d1da): Colors.transparent,
                        color2: index==0 ? Color(0xFFdfe9f3) : Color(0xFFc8d1da),
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
