import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/home_page.dart';
import 'package:smartta/constants/size.dart';
import 'package:smartta/login_page.dart';
import 'package:smartta/profil_page.dart';
import 'package:smartta/transaksi_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    cekLogin();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TransaksiPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset("assets/home.png",
              height: kBottomNavigationBarItemSize,
              color: kPrimaryColor,
            ),
            icon: Image.asset("assets/home_outlined.png",
              height: kBottomNavigationBarItemSize,
              color: kPrimaryColor,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/transaksi.png",
                height: kBottomNavigationBarItemSize,
                color: kPrimaryColor,
              ),
              icon: Image.asset("assets/transaksi_outlined.png",
                height: kBottomNavigationBarItemSize,
                color: kPrimaryColor,),
              label: 'Transaksi'
          ),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/profil.png",
                height: kBottomNavigationBarItemSize,
                color: kPrimaryColor,
              ),
              icon: Image.asset("assets/profil_outlined.png",
                height: kBottomNavigationBarItemSize,
                color: kPrimaryColor,),
              label: 'Profil'
          ),
        ],
        currentIndex: _selectIndex,
        onTap: (int index){
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }

  void cekLogin() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString("id") == null){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
            (route) => false,
      );
    }
  }
}
