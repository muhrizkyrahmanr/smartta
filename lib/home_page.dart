import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smartta/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: const [
            AppBar()
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Stack(
        children: <Widget>[buildHeader(), buildCoursel()],
      )
    );
  }

  buildHeader(){
    return Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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


