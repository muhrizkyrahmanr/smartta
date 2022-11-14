import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<ModelPaket>? modelPaket;
  int? jenisPaket;
  int jumlahItem = 0;
  int harga = 0;
  final TextEditingController _controllerCatatan = TextEditingController();

  Future _getDetailJasa() async {
    setState(() {
      isLoading = true;
    });
    var response = await Services().getDetailDataServices(widget.id);
    if (!mounted) return;
    setState(() {
      modelDetailJasa = response;
      modelPaket = modelDetailJasa!.paket;
      isLoading = false;
    });
  }

  Future onRefresh() async{
    await _getDetailJasa();
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
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SizedBox(
              width: size.width, height: size.height, child: buildDetailJasa()),
        )
      ),
      bottomNavigationBar: buildButton(),
    );
  }

  Widget buildDetailJasa(){
    return isLoading == true
        ? Center(child: CircularProgressIndicator(),)
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            bottom: 5.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0,),
          ),
          child: Column(
            children: [
              Image.network("${modelDetailJasa!.background}"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Deskripsi Pekerjaan", style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w100,),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("${modelDetailJasa!.deskripsi_pekerjaan}")
                  ],
                ),
              )
            ],
          ),
        ),
        if(modelPaket!.length > 0)...[
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Card(
              elevation: 1.0,
              margin: EdgeInsets.only(
                bottom: 5.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0,),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: modelPaket!.length,
                  itemBuilder: (context, i){
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          jenisPaket = modelPaket![i].id;
                          harga = int.parse(modelPaket![i].harga.toString());
                          if(jumlahItem == 0){
                            jumlahItem = 1;
                          }else{
                            harga = harga * jumlahItem;
                          }
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        margin: const EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: jenisPaket == modelPaket![i].id
                                ? kPrimaryColor.withOpacity(0.5)
                                : kGrey
                        ),
                        child: Text(
                          "${modelPaket![i].paket}",
                          style: const TextStyle(color: kBlack),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          )
        ],
        SizedBox(
          height: 8.0,
        ),
        Card(
            elevation: 1.0,
            margin: EdgeInsets.only(
              bottom: 5.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0,),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Masukkan Jumlah"),
                  Spacer(),
                  IconButton(
                    icon: Image.asset(
                      'assets/less.png',
                      width: 20,
                    ),
                    onPressed: () {
                      if(jumlahItem != 0){
                        setState(() {
                          jumlahItem--;
                        });
                      }
                    },
                  ),
                  Text(jumlahItem.toString()),
                  IconButton(
                    icon: Image.asset(
                      'assets/add.png',
                      width: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        jumlahItem++;
                      });
                    },
                  ),
                ],
              ),
            )
        ),
        SizedBox(
          height: 8.0,
        ),
        Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            bottom: 5.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0,),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Catatan", style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w100,),),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      controller: _controllerCatatan,
                      keyboardType: TextInputType.text,
                      maxLines: 4,
                      autofocus: false,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintText: "Masukkan Catatan",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      autocorrect: false,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Bayar :',
                    ),
                    Text(
                      'Rp. ${harga.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Material(
            elevation: 0.0,
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {},
              child: Container(
                width: 160.0,
                child: Center(
                  child: Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
