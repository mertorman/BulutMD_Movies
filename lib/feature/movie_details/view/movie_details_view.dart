import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_frontend_app/feature/home/model/movies_model.dart';
import 'package:netflix_frontend_app/feature/home/widgets/app_bar_widget.dart';
import 'package:netflix_frontend_app/feature/home/widgets/bottom_bar_widget.dart';

class Movie_Details extends StatefulWidget {
  const Movie_Details({super.key});

  @override
  State<Movie_Details> createState() => _Movie_DetailsState();
}

class _Movie_DetailsState extends State<Movie_Details> {
  final TextEditingController _searchQuery = TextEditingController();
  late List<MoviesModel> _searchList;

  late bool _IsSearching;
  late String _searchText = "";
  @override
  void initState() {
    _IsSearching = false;
    _searchList = MoviesModels.movies;
     _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
    super.initState();
  }
  List<MoviesModel> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = MoviesModels.movies;
    } else {
      _searchList = MoviesModels.movies
          .where((element) =>

              element.title.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }
void _handleSearchEnd() {
    setState(() {
     
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
  

  @override
  Widget build(BuildContext context) {
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
                    child: Text('Popüler Başlıklar',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
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
                  controller: _searchQuery,
                  onTap: () {
                    setState(() {
                      _handleSearchStart();
                    });
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Film / Dizi / Oyuncu ara',
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
                    title: Text("Sırala",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 16)),
                    children: [
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {},
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
                        onTap: () {},
                        child: Text("Eskiye Göre Sırala",
                            style: GoogleFonts.poppins(fontSize: 16)),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Divider(color: Colors.black, thickness: 1)),
                      InkWell(
                        onTap: () {},
                        child: Text("Puana Göre Sırala",
                            style: GoogleFonts.poppins(fontSize: 16)),
                      ),
                      Divider(color: Colors.black, thickness: 1),
                      InkWell(
                        onTap: () {},
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
              child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: _searchList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                                size: Size.fromRadius(90),
                                child: Image.asset(
                                    _searchList[index].movieImages,
                                    fit: BoxFit.fill))),
                        SizedBox(
                          height: 5,
                        ),
                        Text(_searchList[index].title,
                            style: GoogleFonts.poppins(fontSize: 16))
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
