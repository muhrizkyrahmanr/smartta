import 'package:custom_clippers/custom_clippers.dart';
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
        padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: buildChatMitra()
      ),
      bottomSheet: bottomSheet(),
    );
  }

  buildChatMitra(){
    return ListView(
      padding: EdgeInsets.only(bottom: 70),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: UpperNipMessageClipper(
                      MessageType.receive
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xFFE1E1E2),
                      ),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
                    ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                  )
                ],
              ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(padding: EdgeInsets.only(top: 20, left: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipPath(
                        clipper: LowerNipMessageClipper(
                            MessageType.send
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          child: Text("Congue nisi vitae suscipit tellus mauris. Rhoncus urna neque viverra justo nec ultrices dui. Cras tincidunt lobortis feugiat vivamus at augue eget.", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                      )
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                      clipper: UpperNipMessageClipper(
                          MessageType.receive
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E2),
                        ),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(padding: EdgeInsets.only(top: 20, left: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipPath(
                        clipper: LowerNipMessageClipper(
                            MessageType.send
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          child: Text("Congue nisi vitae suscipit tellus mauris. Rhoncus urna neque viverra justo nec ultrices dui. Cras tincidunt lobortis feugiat vivamus at augue eget.", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                      )
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                      clipper: UpperNipMessageClipper(
                          MessageType.receive
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFE1E1E2),
                        ),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(padding: EdgeInsets.only(top: 20, left: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipPath(
                        clipper: LowerNipMessageClipper(
                            MessageType.send
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          child: Text("Congue nisi vitae suscipit tellus mauris. Rhoncus urna neque viverra justo nec ultrices dui. Cras tincidunt lobortis feugiat vivamus at augue eget.", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text("Sen, 5 Des 2022 15.00", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,),),
                      )
                    ],
                  ),
                ),
              ),
            ],
        )
      ],
    );
  }

  bottomSheet(){
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2, blurRadius: 10, offset: Offset(0,3)
            )
          ]),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerRight,
              width: 270,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Ketik pesan",
                border: InputBorder.none
                ),
              ),
            )
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send, color: kPrimaryColor.withOpacity(0.5), size: 30,
              ),
              color: kPrimaryColor.withOpacity(0.5),
            )
          )
        ],
      ),
    );
  }

}


