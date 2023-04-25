import 'package:intl/intl.dart';

class ModelMovies {
  // API'dan gelen verilerimiz için model oluşturup gerekli değişkenlere verilerin atamasını yaptım.
  String? title;
  double? puan;
  DateTime? yil;
  String? imageUrl;

  ModelMovies(
      {required this.title,
      required this.puan,
      required this.yil,
      required this.imageUrl});

  ModelMovies.fromJson(Map<String, dynamic> json) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd")
        .parse(json['release_date'] ?? json['air_date'] ?? json['first_air_date'] ?? "0");
    puan = json['vote_average'].toDouble() ?? 0.0;
    title = json['original_title'] ?? json['original_name'];
    yil = tempDate;
    imageUrl = json['poster_path'];
  }
}
