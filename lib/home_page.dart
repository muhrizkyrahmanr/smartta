import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/menu_card.dart';
import 'package:smartta/model/model_menu.dart';
import 'package:smartta/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List listMenu = [];
  bool isLoading = true;

  Future _getMenuServices() async {
    var response = await Services().getDataServices();
    if (!mounted) return;
    setState(() {
      listMenu = response;
      isLoading = false;
    });
  }


  @override
  void initState() {
    super.initState();
    _getMenuServices();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Jasa Populer", style: Theme.of(context).textTheme.bodyLarge,),
                          TextButton(
                              onPressed: () => {},
                              child: Text("Lihat Semua >", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Produk Rekomendasi", style: Theme.of(context).textTheme.bodyLarge,),
                          TextButton(
                              onPressed: () => {},
                              child: Text("Lihat Semua >", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kPrimaryColor))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
        )
      ),
    );
  }

  buildHeader(){
    return Container(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        height: 200,
        width: double.infinity,
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
                        hintText: 'Pencarian Produk',
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
          height: 180.0,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Carousel(
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: kPrimaryColor.withOpacity(0.5),
                indicatorBgPadding: 5.0,
                dotIncreasedColor: kPrimaryColor,
                dotBgColor: Colors.transparent,
                dotVerticalPadding: 5.0,
                dotPosition: DotPosition.bottomRight,
                images: [
                  Image.network(
                    "https://www.niagahoster.co.id/blog/wp-content/uploads/2019/10/20-Template-Web-Gratis-dan-Responsive-untuk-Anda.png",
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://www.niagahoster.co.id/blog/wp-content/uploads/2019/04/Download-Template-Bootstrap-Gratis-Untuk-Website-Anda-1.png",
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://www.niagahoster.co.id/blog/wp-content/uploads/2019/11/template-blogger-responsive-gratis.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}


