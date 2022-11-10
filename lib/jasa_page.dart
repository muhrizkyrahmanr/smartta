import 'package:flutter/material.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/detail_jasa_page.dart';
import 'package:smartta/services/services.dart';

class JasaPage extends StatefulWidget {
  const JasaPage({Key? key}) : super(key: key);

  @override
  State<JasaPage> createState() => _JasaPageState();
}

class _JasaPageState extends State<JasaPage> {
  List listJasa = [];
  bool isLoading = true;

  Future _getJasa() async {
    setState(() {
      isLoading = true;
    });
    var response = await Services().getDataServices();
    if (!mounted) return;
    setState(() {
      listJasa = response;
      isLoading = false;
    });
  }

  Future onRefresh() async {
    await _getJasa();
  }

  @override
  void initState() {
    super.initState();
    _getJasa();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        title: Text(
          "Semua Jasa",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
      ),
      body: Padding(
         padding: EdgeInsets.all(8.0),
         child: SizedBox(
             width: size.width, height: size.height, child: buildJasa()),
        ),
      );
  }

  Widget buildJasa() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: isLoading == true
        ? Center(child: CircularProgressIndicator(),)
        : ListView.builder(
        itemCount: listJasa.length,
        itemBuilder: (context, i){
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: kGrey),
            child: ListTile(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailJasaPage(id: listJasa[i].id.toString(),))
                )
              },
              leading: Image.network('${listJasa[i].url_gambar}',width: 30,),
              title: Text(
                "${listJasa[i].nama}",
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_circle_right_rounded, color: kPrimaryColor, size: 20,),
            ),
          );
        },
      ),
    );
  }
}
