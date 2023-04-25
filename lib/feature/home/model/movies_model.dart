import 'package:flutter/material.dart';

class MoviesModel {
  String category;
  String title;
  String movieImages;
  int year;
  int puan;

  MoviesModel(
      {required this.category,
      required this.title,
      required this.movieImages,
      required this.year,
      required this.puan});
}

class MoviesModels {
  static List<MoviesModel> movies = [
    MoviesModel(
        category: 'Dizi',
        title: 'Jumanji',
        movieImages: 'assets/images/movie1.jpg',
        year: 2023,
        puan: 10),
    MoviesModel(
        category: 'Dizi',
        title: 'Breaking Bad',
        movieImages: 'assets/images/movie2.jpg',
        year: 2022,
        puan: 5),
    MoviesModel(
        category: 'Dizi',
        title: 'Dark',
        movieImages: 'assets/images/movie3.jpg',
        year: 2021,
        puan: 8),
    MoviesModel(
        category: 'Dizi',
        title: 'La Casa De Papel',
        movieImages: 'assets/images/movie4.jpg',
        year: 2020,
        puan: 7),
    MoviesModel(
        category: 'Film',
        title: 'ArifV216',
        movieImages: 'assets/images/movie5.jpg',
        year: 2019,
        puan: 6),
    MoviesModel(
        category: 'Film',
        title: 'Kolonya Cumhuriyeti',
        movieImages: 'assets/images/movie6.jpg',
        year: 2018,
        puan: 3),
    MoviesModel(
        category: 'Film',
        title: 'G.O.R.A',
        movieImages: 'assets/images/movie7.jpg',
        year: 2017,
        puan: 1),
  ];
}
