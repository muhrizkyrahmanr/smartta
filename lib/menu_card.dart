import 'package:flutter/material.dart';
import 'package:smartta/model/model_menu.dart';

class MenuCard extends StatefulWidget {
  final listMore;
  ModelMenu? modelMenu;

  MenuCard({Key? key, this.modelMenu, required this.listMore}) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(widget.listMore == false)...[
              Image.network(
                "${widget.modelMenu!.url_gambar}",
                height: 24.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.modelMenu!.nama}",textAlign: TextAlign.center,),
            ]else...[
              Image.asset(
                "assets/more.png",
                height: 24.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Lainnya",textAlign: TextAlign.center,),
            ]
          ],
        ),
      ),
    );
  }
}
