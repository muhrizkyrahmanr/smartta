import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartta/base_screen.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/daftar_page.dart';
import 'package:smartta/services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  late bool _showPassword = true;
  late bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text("Smartta,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text("Login untuk melanjutkan!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                    SizedBox(height: 90,),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                              )
                          ),
                        ),
                        validator: (value) => EmailValidator.validate(_controllerEmail.text) ? null : "Silakan masukkan email yang valid",
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _controllerPassword,
                        obscureText: _showPassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                              )
                          ),
                          suffixIcon: GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: _showPassword
                                ? const Icon(
                              Icons.visibility_off,
                            )
                                : const Icon(
                              Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password masih kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text("Lupa password ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () => {
                            if (!_isLoading) {
                              if (_formKey.currentState!.validate()) {
                                showAlertDialogLoading(context),
                                login()
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Belum punya akun pengguna? ",style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DaftarPage();
                          }));
                        },
                        child: Text("Daftar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void login() async{
    String? token = await FirebaseMessaging.instance.getToken();
    var response = await Services().LoginService(_controllerEmail.text, _controllerPassword.text, token.toString());
    if(response != null && response != 401) {
      if(response['status'] == true){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString("id", response['data']['id'].toString());
        await preferences.setString("email", response['data']['email']);
        await preferences.setString("no_hp", response['data']['no_hp']);
        await preferences.setString("nama", response['data']['nama']);
        await preferences.setString("url_foto", response['data']['url_foto']);
        await preferences.setString("token", response['data']['token']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BaseScreen(),
          ),
              (route) => false,
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: Colors.red,),
              SizedBox(width: 8),
              Flexible(child: Text("Gagal! email atau password salah",style: const TextStyle(fontFamily: 'poppins'),))
            ],
          ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),behavior: SnackBarBehavior.floating,
          elevation: 5,));
        Navigator.pop(context);
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_outline, size: 20, color: Colors.red,),
            SizedBox(width: 8),
            Flexible(child: Text("Gagal! terhubung keserver",style: const TextStyle(fontFamily: 'poppins'),))
          ],
        ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),behavior: SnackBarBehavior.floating,
        elevation: 5,));
      Navigator.pop(context);
    }
  }

  showAlertDialogLoading(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 15), child: const Text("Loading...",style: const TextStyle(fontFamily: 'poppins'),)),
        ],),
    );
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return WillPopScope(
          onWillPop: () async => false,
          child: alert,
        );
      },
    );
  }
}
