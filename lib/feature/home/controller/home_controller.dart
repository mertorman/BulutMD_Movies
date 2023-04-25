import 'package:get/get.dart';
import 'package:netflix_frontend_app/feature/home/model/model_movies.dart';
import 'package:netflix_frontend_app/service/fetch_movies.dart';

class HomeController extends GetxController with StateMixin {
  //State Management yöntemi GetX sayesinde uygulama ilk açıldığında HomeController olan bu sınıf devreye girecek.
  List<ModelMovies> trendMovies = RxList([]);
  List<ModelMovies> trendTv = RxList([]);
  List<ModelMovies> allTvMovies = RxList([]);
  RxString baslik = RxString("");
  RxString textFieldHintText = RxString("");

  @override
  void onInit() async { //Ve ilk olarak asenkron bir şekilde onInit metodu çalışarak API aracılığıyla verilerimizi fetch edecek.
    change(null, status: RxStatus.loading()); //Verilerimizi alırken ana sayfada loading animasyonu gözükecek.
    trendMovies = await FetchMovies.fetchMoviesPopular();
    trendTv = await FetchMovies.fetchTvPopular();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    change(null, status: RxStatus.success()); //Veri alma işlemi bittiğinde ana sayfa açılmış olacak.
  }
}
