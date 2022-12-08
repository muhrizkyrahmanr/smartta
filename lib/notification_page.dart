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
      body: SizedBox(
          width: size.width, height: size.height, child: buildNotification()),
    );
  }

  buildNotification() {
  }
}
