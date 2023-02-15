import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartta/constants/material_colors.dart';
import 'package:smartta/base_screen.dart';
import 'package:smartta/login_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'constants/colors.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: colorCelticBlue,
          fontFamily: 'poppins'
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreens()
    );
  }
}

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        backgroundColor: kWhite,
        imageSrc: 'assets/icon/logo-app.png',
        imageSize: 320,
        duration: 3000,
        navigateRoute: cekLogin == true
            ? BaseScreen()
            : LoginPage()
    );
  }

  Future<bool> cekLogin() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString("id") == null){
      return false;
    }else{
      return true;
    }
  }
}