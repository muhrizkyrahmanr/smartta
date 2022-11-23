import 'package:flutter/material.dart';
import 'package:smartta/alamat_page.dart';
import 'package:smartta/constants/colors.dart';


class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>{

  _getIdentitas() async{

  }

  @override
  void initState(){
    super.initState();
    _getIdentitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              buildHeader(),
              buildBody(),
            ],
          ),
        ));
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xff1b96e3),
              Color(0xc287cefa),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
        ),
      ),
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12.0,
            width: double.infinity,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => {},
                child: CircleAvatar(
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(""),
                  radius: 35,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                children: [
                  Text(
                    'Tess',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18.0, color: kWhite),
                  ),
                  Text(
                    '0811',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18.0, color: kWhite),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 200.0),
      child: Column(
        children: [
          Container(
          width: double.infinity,
          color: kWhite,
          margin: const EdgeInsets.only(bottom: 4),
          child: ListTile(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AlamatPage())
              )
            },
            leading: Image.asset("assets/home_outlined.png",
              height: 25,
              color: kPrimaryColor,
            ),
            title: const Text(
              "Alamat",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kPrimaryColor,
            ),
          )),
          Container(
              width: double.infinity,
              color: kWhite,
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                leading: Image.asset("assets/password_outlined.png",
                  height: 25,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "Ganti password",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kPrimaryColor,
                ),
              )),
          Container(
              width: double.infinity,
              color: kWhite,
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                leading: Image.asset("assets/how_outlined.png",
                  height: 25,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "Bantuan",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kPrimaryColor,
                ),
              )),
          Container(
              width: double.infinity,
              color: kWhite,
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                leading: Image.asset("assets/info_outlined.png",
                  height: 25,
                  color: kPrimaryColor,
                ),
                title: const Text(
                  "Ketentuan Layanan",
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: kPrimaryColor,
                ),
              )),
          buttonLogout()
        ],
      ),
    );
  }

  Widget buttonLogout() {
    return Container(
        width: double.infinity,
        color: kWhite,
        margin: const EdgeInsets.only(bottom: 4),
        child: GestureDetector(
          onTap: () {
            showAlertExit(context);
          },
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ));
  }

  showAlertExit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi', style: const TextStyle(fontFamily: 'poppins'),),
            content: const Text('Anda yakin ingin Keluar ?', style: const TextStyle(fontFamily: 'poppins'),),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Batal',
                    style: TextStyle(fontFamily: 'poppins', color: Colors.grey),
                  )),
              TextButton(
                  onPressed: () {
                    signOut();
                  },
                  child: const Text('Ya', style: const TextStyle(fontFamily: 'poppins'),))
            ],
          );
        });
  }

  signOut() async {
  }
}