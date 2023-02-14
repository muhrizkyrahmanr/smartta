import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/otp_verifikasi_page.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPassword2 = TextEditingController();
  final TextEditingController _controllerNomorHP = TextEditingController();

  late bool _showPassword = true;
  late bool _showPassword2 = true;

  late bool _validNama = true;
  late bool _validEmail = true;
  late bool _validPassword = true;
  late bool _validPassword2 = true;
  late bool _validNoHP = true;

  var _imageFile;

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
                    Text("Smartta,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text("Daftar untuk memulai!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                    SizedBox(height: 30,),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _controllerNama,
                        decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(
                              Icons.account_circle_outlined,
                              color: _validNama ? null : Colors.red,
                          ),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              _validNama = false;
                            });
                            return 'Nama lengkap masih kosong';
                          }else{
                            setState(() {
                              _validNama = true;
                            });
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(
                              Icons.email_outlined,
                              color: _validEmail ? null : Colors.red,
                          ),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                          validator: (value) {
                            if(value!.isEmpty){
                              setState(() {
                                _validEmail = false;
                              });
                              return 'Email masih kosong';
                            }else{
                              if(!EmailValidator.validate(_controllerEmail.text)){
                                setState(() {
                                  _validEmail = false;
                                });
                                return 'Silahkan masukkan email yang valid';
                              }else{
                                setState(() {
                                  _validEmail = true;
                                });
                              }
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _controllerPassword,
                        obscureText: _showPassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(
                              Icons.lock_outline,
                              color: _validPassword ? null : Colors.red,
                          ),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: _showPassword
                                ? Icon(
                              Icons.visibility_off,
                              color: _validPassword ? null : Colors.red,
                            )
                                : Icon(
                              Icons.visibility,
                              color: _validPassword ? null : Colors.red,
                            ),
                          ),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            setState(() {
                              _validPassword = false;
                            });
                            return 'Password masih kosong';
                          }else{
                            setState(() {
                              _validPassword = true;
                            });
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _controllerPassword2,
                        obscureText: _showPassword2,
                        decoration: InputDecoration(
                          labelText: "Ulangi Password",
                          prefixIcon: Icon(
                              Icons.lock_outline,
                              color: _validPassword2 ? null : Colors.red,
                          ),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: GestureDetector(
                            onTap: togglePassword2Visibility,
                            child: _showPassword2
                                ? Icon(
                              Icons.visibility_off,
                              color: _validPassword2 ? null : Colors.red,
                            )
                                : Icon(
                              Icons.visibility,
                              color: _validPassword2 ? null : Colors.red,
                            ),
                          ),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            setState(() {
                              _validPassword2 = false;
                            });
                            return 'Konfirmasi password masih kosong';
                          }else{
                            if(!_controllerPassword.text.isEmpty){
                              if(_controllerPassword.text != _controllerPassword2.text){
                                setState(() {
                                  _validPassword2 = false;
                                });
                                return 'Password tidak sama';
                              }else{
                                setState(() {
                                  _validPassword2 = true;
                                });
                              }
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _controllerNomorHP,
                        decoration: InputDecoration(
                          labelText: "Nomor HP",
                          prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: _validNoHP ? null : Colors.red,
                          ),
                          labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value){
                          if (value!.isEmpty) {
                            setState(() {
                              _validNoHP = false;
                            });
                            return 'No HP masih kosong';
                          }else{
                            setState(() {
                              _validNoHP = true;
                            });
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      TextButton(
                        onPressed: pickImage,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.grey.shade300),
                                )
                            ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/upload_foto.png",
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text("Upload Foto",style: TextStyle(
                                color: Colors.grey.shade600,
                                ),
                              ),
                              if(_imageFile != null)...[//
                                // Conditionally widget(s) here
                                Spacer(),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: kPrimaryColor.withOpacity(0.5),
                                )
                              ]else...[
                                Spacer(),
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                )
                              ],
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        child: InkWell(
                          onTap: (){
                            if (_formKey.currentState!.validate()) {
                              if(_imageFile != null){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return OtpVerifikasiPage();
                                }));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(Icons.info_outline, size: 20, color: Colors.red,),
                                      SizedBox(width: 8),
                                      Flexible(child: Text("Gagal! anda belum mengupload foto",style: const TextStyle(fontFamily: 'poppins'),))
                                    ],
                                  ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),behavior: SnackBarBehavior.floating,
                                  elevation: 5,));
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
                                'Buat Akun',
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sudah punya akun pengguna? ",style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text("Masuk",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor),),
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

  void togglePassword2Visibility() {
    setState(() {
      _showPassword2 = !_showPassword2;
    });
  }

  pickImage() async {
    final _pickImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    var filePath = File(_pickImage!.path);
    setState(() {
      _imageFile = filePath;
    });
  }
}
