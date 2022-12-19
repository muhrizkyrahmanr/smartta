import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        title: Text(
          "Notification",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        )
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: buildNotification()
      ),
    );
  }

  Widget buildNotification() {
    return Card(
        child: Container(
          height: 115,
          child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 22,
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Transaksi",
                      style: TextStyle(color: kPrimaryColor.withOpacity(0.5),),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Pesanan dengan nomor transaksi #123 telah dikonfirmasi oleh mitra. Silahkan cek di transaksi untuk perkembangan selanjutnya",
              )
          ),
        )
    );
  }
}
