import 'package:flutter/material.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/model/model_detail_jasa.dart';
import 'package:smartta/model/model_menu.dart';
import 'package:smartta/model/model_paket.dart';
import 'package:smartta/services/services.dart';

class DetailJasaPage extends StatefulWidget {
  final String id;

  const DetailJasaPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailJasaPage> createState() => _DetailJasaPageState();
}

class _DetailJasaPageState extends State<DetailJasaPage> {
  bool isLoading = true;
  ModelDetailJasa? modelDetailJasa;
  ModelPaket? modelPaket;

  Future _getDetailJasa() async {
    setState(() {
      isLoading = true;
    });
    var response = await Services().getDetailDataServices(widget.id);
    if (!mounted) return;
    setState(() {
      modelDetailJasa = response.paket;
    });
    print(modelPaket!.paket.toString());
  }


  @override
  void initState() {
    super.initState();
    _getDetailJasa();
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
          "Detail Jasa",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
            width: size.width, height: size.height, child: buildDetailJasa()),
      ),
    );
  }

  Widget buildDetailJasa(){
    return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ],
        )
    );
  }
}
