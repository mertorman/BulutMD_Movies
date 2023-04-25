import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_frontend_app/feature/home/controller/home_controller.dart';
import 'package:netflix_frontend_app/feature/home/model/model_movies.dart';

class MovieDetailsController extends GetxController with StateMixin {
  // Dizi/Film detay ekranı için gerekli durumlu değişkenlerin tanımlamalarını gerçekleştirdim. 
  HomeController homeController = Get.find();
  final TextEditingController searchQuery = TextEditingController();
  RxString defaultText = RxString('Sırala');
  RxList<ModelMovies> searchList = RxList();
  RxBool IsSearching = RxBool(false);
  late RxString searchText = RxString("");

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    IsSearching.value = false;
    searchList.value = homeController.allTvMovies;
    searchQuery.addListener(() { // Dizi/Film araması yapmak için textfield'ın controllerini, ekran açıldığı anda dinlemeye başladım.
      if (searchQuery.text.isEmpty) {
        IsSearching.value = false;
        searchText.value = "";
        _buildSearchList();
      } else {
        IsSearching.value = true;
        searchText.value = searchQuery.text;
        _buildSearchList();
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  void handleSearchStart() {
    IsSearching.value = true;
  }

  void handleSearchEnd() {
    IsSearching.value = false;
    searchQuery.clear();
  }

  void textChange(String text) {
    defaultText.value = text;
  }

  void listSort(String filter) { //Filtreleme işlemi için tarih bazlı sıralama işlemi gerçekleştirdim.
    if (filter == 'Yeniye Göre Sırala') {
      searchList.sort(
        (a, b) {
          var r = b.yil!.compareTo(a.yil!);
          return r;
        },
      );
    } else if (filter == 'Eskiye Göre Sırala') {  //Filtreleme işlemi için tarih bazlı sıralama işlemi gerçekleştirdim.
      searchList.sort(
        (a, b) {
          var r = a.yil!.compareTo(b.yil!);
          return r;
        },
      );
    } else if (filter == 'Puana Göre Sırala') { //Filtreleme işlemi için puan bazlı sıralama işlemi gerçekleştirdim.
      searchList.sort(
        (a, b) {
          var r = b.puan!.compareTo(a.puan!);
          return r;
        },
      );
    } else {
      searchList.shuffle();   //Filtreleme işlemi için dizi/film listesini rastgele olarak karıştırdım.
    }
  }

  List<ModelMovies> _buildSearchList() {
    if (searchText.isEmpty) {
      return searchList.value = homeController.allTvMovies;
    } else {
      searchList.value = homeController.allTvMovies // Arama yaparken textfield içerisindeki harfleri tek tek dizi/film listemizin içerisindeki başlıklarla tek tek karşılaştırıp sonuçları liste haline getirdim.
          .where((element) => element.title!
              .toLowerCase()
              .contains(searchText.value.toLowerCase()))
          .toList();
      print('${searchList.length}');
      return searchList;
    }
  }
}
