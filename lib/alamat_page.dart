import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartta/constants/colors.dart';
import 'package:smartta/maps_page.dart';
import 'package:smartta/services/services.dart';

class AlamatPage extends StatefulWidget {
  const AlamatPage({Key? key}) : super(key: key);

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  List ListAlamat = [];
  bool isLoading = true;

  Future _getAlamat() async {
    var response = await Services().getAlamat("081345975566");
    if (!mounted) return;
    setState(() {
      ListAlamat = response;
      isLoading = false;
    });
  }

  Future onRefresh() async {
    setState(() {
      isLoading = true;
    });
    await _getAlamat();
  }


  @override
  void initState() {
    super.initState();
    _getAlamat();
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
          "Alamat",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MapsPage();
              }));
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: isLoading == true
              ? Center(
                child: CircularProgressIndicator()
              )
              : ListView.builder(
                  itemCount: ListAlamat.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => {
                        Navigator.of(context).pop()
                      },
                      child: Card(
                          child: Container(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                    title: Text(
                                      "${ListAlamat[i].nama}",
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                    ),
                                    subtitle: Text(
                                      "${ListAlamat[i].alamat}, ${ListAlamat[i].kecamatan}, ${ListAlamat[i].kota}, ${ListAlamat[i].provinsi}",
                                      maxLines: 1,
                                    )
                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  }
              )
        )
      ),
    );
  }
}
