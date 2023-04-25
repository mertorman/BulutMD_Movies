import 'package:flutter/material.dart';
import 'package:netflix_frontend_app/feature/home/view/homepage_view.dart';
import 'package:netflix_frontend_app/feature/movie_details/view/movie_details_view.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage()

    );
  }
}