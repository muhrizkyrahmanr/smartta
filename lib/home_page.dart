import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/detailartikel_page.dart';
import 'package:smartta/menu_card.dart';
import 'package:smartta/model/model_menu.dart';
import 'package:smartta/services/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  List listBanner = [];
  int _currentIndex = 0;
  List listMenu = [];
  bool isLoading = true;
  List listArtikel = [];

  Future _getBanner() async {
    var response = await Services().getBannerServices();
    if (!mounted) return;
    setState(() {
      listBanner = response;
    });
  }

  Future _getMenuServices() async {
    var response = await Services().getDataServices();
    if (!mounted) return;
    setState(() {
      listMenu = response;
      isLoading = false;
    });
  }

  Future _getArtikelServices() async {
    var response = await Services().getArtikelServices();
    if (!mounted) return;
    setState(() {
      listArtikel = response;
    });
  }


  @override
  void initState() {
    super.initState();
    _getBanner();
    _getMenuServices();
    _getArtikelServices();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[buildHeader(), buildCoursel()],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      if(isLoading == true)...[
                        Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Center(child: CircularProgressIndicator(),),
                        ),
                      ]else...[
                        GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 24,
                            ),
                            itemBuilder: (context, index){
                              return index == 5
                                  ? MenuCard(listMore: true,)
                                  : MenuCard(
                                      modelMenu: listMenu[index],
                                      listMore: false,
                                    );
                            },
                        ),
                      ],
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Jasa Populer", style: Theme.of(context).textTheme.bodyLarge,),
                      //     TextButton(
                      //         onPressed: () => {},
                      //         child: Text("Lihat Semua >", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor))),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Artikel", style: Theme.of(context).textTheme.bodyLarge,),
                          TextButton(
                              onPressed: () => {},
                              child: Text("Lihat Semua >", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor))),
                        ],
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child:  ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listArtikel.length < 3
                                ? listArtikel.length
                                : 3,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailArtikelPage(judul: listArtikel[i].title, slug: listArtikel[i].slug,)
                                        )
                                    );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 15.0),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                  color: kPrimaryColor.withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Text("${listArtikel[i].jenis}", style: TextStyle(color: kWhite, fontSize: 12.0),),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text("${listArtikel[i].title}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(listArtikel[i].url_gambar,width: 80,),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              ],
            )
        )
      ),
    );
  }

  Widget itemArtikel(size) {
    return SizedBox(
      height: size.height / 1.1,
      child: Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listArtikel.length < 3
                  ? listArtikel.length
                  : 3,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("${listArtikel[i].jenis}", style: TextStyle(color: kWhite, fontSize: 12.0),),
                                ),
                                Text("${listArtikel[i].title}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),),
                              ],
                            ),
                            Spacer(),
                            Image.network(listArtikel[i].url_gambar,width: 80,),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),),
    );
  }

  buildHeader(){
    return Container(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
              colors: [
                Color(0xff1b96e3),
                Color(0xc287cefa),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage("https://st.depositphotos.com/1144472/2003/i/600/depositphotos_20030237-stock-photo-cheerful-young-man-over-white.jpg"),
                  radius: 26,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(32),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pencarian Jasa',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }

  buildCoursel(){
    return Padding(
      padding: EdgeInsets.only(top: 120.0, left: 16.0, right: 16.0),
      child: Container(
          height: 170.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                children: [
                  CarouselSlider(
                      items: [
                        for (var i = 0; i < listBanner.length; i++)
                          Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "${listBanner[i].url_gambar}",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Gagal Memuat Gambar!",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          )
                      ],
                      carouselController: _carouselController,
                      options: CarouselOptions(
                          viewportFraction: 1,
                          aspectRatio: 2.4,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          initialPage: 2,
                          pauseAutoPlayOnTouch: true,
                          autoPlayInterval: const Duration(seconds: 7),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          })),
                  Container(
                    alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0, bottom: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: listBanner.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _carouselController.animateToPage(entry.key),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : kPrimaryColor)
                                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ),
                ],
              ),
              ),
            ),
          )
      );
  }
}


