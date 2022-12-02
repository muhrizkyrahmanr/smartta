import 'package:flutter/material.dart';
import 'package:smartta/chat_mitra_page.dart';
import 'package:smartta/constants/colors.dart';

class DetailTransaksi extends StatefulWidget {
  const DetailTransaksi({Key? key}) : super(key: key);

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  int currentStep = 0;
  List<Map<String, String>> list = [
    {
      'date': '09.30AM',
      'title': 'Order Placed',
      'sub': 'Your order #212423 was placed for delivery'
    },
    {'date': '09.35AM', 'title': 'Pending', 'sub': 'Your order is pending for confirmation'},
    {'date': '09.55AM', 'title': 'Confirmed', 'sub': 'Your order is confirmed'},
    {
      'date': '10.30AM',
      'title': 'Processing',
      'sub': 'Your product is processing to de'
    },
    {'date': '10.45AM', 'title': 'Delivered', 'sub': 'Product delivered to you'},
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kWhite, //change your color here
        ),
        title: Text(
          "Detail Transaksi",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
            width: size.width, height: size.height, child: buildDetailTransaksi()),
      ),
    );
  }

  Widget buildDetailTransaksi(){
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              title: Row(
                children: [
                  Text("#123", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
                  Spacer(),
                  Text("24 Nov 2022", style: TextStyle(fontSize: 14.0, color: Colors.grey),)
                ],
              ),
              leading: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey.withOpacity(0.10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network("http://smartta.id/assets/serviceIcon/Install%20dan%20Service.png", height: 35.0,),
                )
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Install & Service",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
                  ),
                  Text(
                    "Alamat", style: TextStyle(fontSize: 12.0),
                  ),
                ],
              )
          ),
          Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey.withOpacity(0.10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mitra", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage("https://st.depositphotos.com/1144472/2003/i/600/depositphotos_20030237-stock-photo-cheerful-young-man-over-white.jpg"),
                          radius: 26,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mitra Simulasi",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                              Text("Alamat",style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ChatMitraPage();
                            }));
                          },
                          icon: Icon(
                            Icons.chat,
                          ),
                          color: kPrimaryColor.withOpacity(0.5),
                        )
                      ],
                    ),
                  ],
                ),
              )
          ),
          Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey.withOpacity(0.10),
              ),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pesanan", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,)),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text("Windows 10 Rp 100.000/Unit"),
                          Spacer(),
                          Text("x2")
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text("Total pembayaran"),
                          Spacer(),
                          Text("Rp. 200.000")
                        ],
                      )
                    ],
                  )
              )
          ),
          Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey.withOpacity(0.10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status Pesanan", style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400,)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return currentStep >= index ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(list[index]['date']!),
                              ),
                              const SizedBox(width: 5),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.check_circle, color: kPrimaryColor.withOpacity(0.5), size: 20.0,),
                                  const SizedBox(height: 5),
                                  index < list.length - 1 ? Container(
                                      height: 15,
                                      width: 1,
                                      color: kPrimaryColor.withOpacity(0.5),
                                  ) : Container(),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(list[index]['title']!, style: const TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Flexible(child: Text(list[index]['sub']!)),
                                  ],
                                ),
                              ),
                            ],
                          ) : Container();
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      ),
                    ),
                    // ElevatedButton(onPressed: () {
                    //   setState(() {
                    //     currentStep += 1;
                    //   });
                    // }, child: const Text('Change Step'))
                  ],
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: Text(
              "* Apaliba mitra terkendala datang atau mitra lambat merespon dari jam yang ditetapkan pada saat memesan, anda bisa membatalkan pesanan dengan cara klik tombol batalkan.",style: TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.5),),
            )
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: InkWell(
                onTap: () => {},
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                  child: const Center(
                    child: Text(
                      'Batalkan',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
