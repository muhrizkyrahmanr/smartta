import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smartta/constants/colors.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _mapInitialPosition = CameraPosition(
    target: LatLng(-5.1708758,119.4780072),
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kWhite, //change your color here
          ),
          title: Text(
            "Maps",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: kWhite),
          ),
        ),
      body: GoogleView(),
    );
  }

  Widget GoogleView() {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _mapInitialPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _handleTap
    );
  }

  _handleTap(LatLng point) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId("${point.latitude}, ${point.longitude}"),
        icon: BitmapDescriptor.defaultMarker,
        position: point,
      ));
      dialogSave(context);
    });
  }

  Future dialogSave(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alamat'),
          content: new Row(
            children: [
              new Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Label alamat', hintText: 'Masukkan label alamat'),
                  ))
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('Simpan', style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        );
      },
    );
  }
}
