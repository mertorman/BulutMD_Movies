import 'package:flutter/material.dart';

class MoviesModel {
  String category;
  String title;
  String movieImages;

  MoviesModel(
      {required this.category,
      required this.title,
      required this.movieImages,
     });

}

class MoviesModels {
  static List<MoviesModel> movies = [
    MoviesModel(
        category: 'Dizi',
        title: 'Jumanji',
        movieImages: 'assets/images/movie1.jpg',
        ),
    MoviesModel(
        category: 'Dizi',
        title: 'Breaking Bad',
        movieImages: 'assets/images/movie2.jpg',
        ),
    MoviesModel(
        category: 'Dizi',
        title: 'Dark',
        movieImages: 'assets/images/movie3.jpg',
       ),
    MoviesModel(
        category: 'Dizi',
        title: 'La Casa De Papel',
        movieImages: 'assets/images/movie4.jpg',
        ),
    MoviesModel(
        category: 'Film',
        title: 'ArifV216',
        movieImages: 'assets/images/movie5.jpg',
        ),
    MoviesModel(
        category: 'Film',
        title: 'Kolonya Cumhuriyeti',
        movieImages: 'assets/images/movie6.jpg',
        ),
    MoviesModel(
        category: 'Film',
        title: 'G.O.R.A',
        movieImages: 'assets/images/movie7.jpg',
        ),
  ];
  
}
