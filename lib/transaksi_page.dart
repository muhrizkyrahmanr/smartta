import 'package:flutter/material.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/list_pesanan.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: kWhite,
              labelColor: kWhite,
              tabs: [
                Tab(text: "Pesanan"),
                Tab(text: "Riwayat"),
              ],
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Transaksi",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TabBarView(children: <Widget>[ListPesanan(), ListPesanan()]),
          ),
        )
    );
  }
}
