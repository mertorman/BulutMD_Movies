import 'package:netflix_frontend_app/feature/home/model/model_movies.dart';
import 'package:netflix_frontend_app/utils/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class FetchMovies {
  //Dizi ve film verilerini bu class'ta fetch edip, sonuçların liste haline döndürülüp ilgili yere gönderilmesini sağladım.
  List<ModelMovies> trendMovies = [];
  List<ModelMovies> trendTv = [];
  static TMDB tmdb = TMDB(ApiKeys(AppConstants.apiKey, AppConstants.readAccessToken));

  static Future<List<ModelMovies>> fetchMoviesPopular() async {
    Map trendingResult = await tmdb.v3.movies.getPopular(); 
    final result = trendingResult['results'] as List;
    final result2 = result.map((e) => ModelMovies.fromJson(e)).toList(); 
    return result2;
  }

  static Future<List<ModelMovies>> fetchTvPopular() async {
    Map trendingResult = await tmdb.v3.tv.getPopular();
    final result = trendingResult['results'] as List;
    final result2 = result.map((e) => ModelMovies.fromJson(e)).toList();
    return result2;
  }
}
