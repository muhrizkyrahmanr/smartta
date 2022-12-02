import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMitraPage extends StatefulWidget {
  const ChatMitraPage({Key? key}) : super(key: key);

  @override
  State<ChatMitraPage> createState() => _ChatMitraPageState();
}

class _ChatMitraPageState extends State<ChatMitraPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.white,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage("https://st.depositphotos.com/1144472/2003/i/600/depositphotos_20030237-stock-photo-cheerful-young-man-over-white.jpg"),
                  radius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Mitra Simulasi", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: "085728761701",
                    );
                    launchUrl(launchUri);
                  },
                )
              ],
            ),
          ),
        ),
        // title: Text(
        //   "Mitra Simulasi",
        //   style: const TextStyle(
        //       fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.call,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // do something
        //     },
        //   )
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
            width: size.width, height: size.height, child: buildChatMitra()),
      ),
    );
  }

  buildChatMitra(){
  }

}


