import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/detailtransaksi_page.dart';

class ListPesanan extends StatefulWidget {
  ListPesanan({Key? key}) : super(key: key);

  @override
  State<ListPesanan> createState() => _ListPesananState();
}

class _ListPesananState extends State<ListPesanan> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: itemListPesanan()
    );
  }

  Widget itemListPesanan(){
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailTransaksi())
        )
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    title: Row(
                      children: [
                        Text("#123", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
                        Spacer(),
                        Text("24 Nov 2022", style: TextStyle(fontSize: 14.0, color: Colors.grey),)
                      ],
                    ),
                    leading: Image.network("http://smartta.id/assets/serviceIcon/Install%20dan%20Service.png", height: 35.0,),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Install & Service",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
                        ),
                        Text(
                          "Alamat", style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text("Status Pesanan", style: TextStyle(fontSize: 14.0),),
                          Spacer(),
                          Text("Rp. 200.000", style: TextStyle(fontSize: 14.0),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}