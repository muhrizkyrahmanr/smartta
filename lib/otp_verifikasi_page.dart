import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/login_page.dart';

class OtpVerifikasiPage extends StatefulWidget {
  const OtpVerifikasiPage({Key? key}) : super(key: key);

  @override
  State<OtpVerifikasiPage> createState() => _OtpVerifikasiPageState();
}

class _OtpVerifikasiPageState extends State<OtpVerifikasiPage> {
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
                    SizedBox(height: 6,),
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, size: 20,)),
                    SizedBox(height: 20,),
                    Text("Kode OTP sudah dikirim!",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text("Masukkan kode OTP yang kami kirim ke email anda yang terdaftar muhrizkyrahmanr@gmail.com",style: TextStyle(color: Colors.grey.shade400),),
                    SizedBox(height: 30,),
                  ],
                ),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 58,
                        width: 54,
                        child: TextFormField(
                          onSaved: (pin1) {},
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 58,
                        width: 54,
                        child: TextFormField(
                          onSaved: (pin2) {},
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 58,
                        width: 54,
                        child: TextFormField(
                          onSaved: (pin3) {},
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 58,
                        width: 54,
                        child: TextFormField(
                          onSaved: (pin4) {},
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(hintText: "0"),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage(),
                        ),
                            (route) => false,
                      );
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
                          'Konfirmasi',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Kode OTP belum diterima?",style: TextStyle(fontWeight: FontWeight.bold),),
                    InkWell(
                      onTap: (){},
                      child: Text(" Kirim ulang ",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
