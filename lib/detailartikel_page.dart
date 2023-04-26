import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArtikelPage extends StatefulWidget {
  String? judul, slug;
  DetailArtikelPage({Key? key, this.judul, this.slug}) : super(key: key);

  @override
  State<DetailArtikelPage> createState() => _DetailArtikelPageState();
}

class _DetailArtikelPageState extends State<DetailArtikelPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        title: Text(
          "${widget.judul}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
      ),
      body: SizedBox(
          width: size.width, height: size.height, child: buildDetailArtikel()),
    );
  }

  Widget buildDetailArtikel(){
    return WebView(
        initialUrl: 'http://10.153.16.164/blog/${widget.slug}'
    );
  }
}
