import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/maps_page.dart';

class AlamatPage extends StatefulWidget {
  const AlamatPage({Key? key}) : super(key: key);

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        title: Text(
          "Alamat",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MapsPage();
              }));
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: buildAlamat()
      ),
    );
  }

  Widget buildAlamat() {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pop()
      },
      child: Card(
          child: Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    title: Text(
                      "Kantor Disdik",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      "Jl. Perintis Kemerdekaan KM 10, Tamalanrea Indah, Kec. Tamalanrea, Kota Makassar",
                      maxLines: 1,
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}
