import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'drawer.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  ///call back
  MapType currentMapType = MapType.normal;

  void callback(com) {
    setState(() {
      currentMapType = com;
    });
  }

  final List<Marker> _markers = [
    const Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(22.719568, 75.857727),
      infoWindow: InfoWindow(
        title: 'Bengali Square',
      ),
    ),
    const Marker(
      markerId: MarkerId('id-2'),
      position: LatLng(22.719567, 74.857727),
      infoWindow: InfoWindow(
        title: 'pip Square',
      ),
    ),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {});
    return await Geolocator.getCurrentPosition();
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Google Map'),


            // actions: [
            //   CustomSwitch(
            //     activeColor: Colors.pinkAccent,
            //     value: isSwitched,
            //     onChanged: (value) {
            //       print("VALUE : $value");
            //       setState(() {
            //         isSwitched = value;
            //       });
            //     },
            //   ),
            //   SizedBox(height: 12.0,),
            //   Text('Value : $isSwitched', style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20.0
            //   ),)
            // ],



          ),
          drawer: Drawers(
            callback: callback,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.my_location),
            onPressed: () async {
              getUserCurrentLocation().then((value) async {
                _markers.add(
                  Marker(
                      markerId: MarkerId('2'),
                      position: LatLng(value.latitude, value.longitude),
                      infoWindow: InfoWindow(title: 'My Current Location')),
                );

                CameraPosition cameraPosition = CameraPosition(
                    zoom: 15, target: LatLng(value.latitude, value.longitude));
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(

                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
          ),
          body: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.719568, 75.857727),
              zoom: 15,

            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                _markers.addAll(_markers);
              });
            },
            mapType: currentMapType,
            markers: Set<Marker>.of(_markers),
          )),

    );
  }
}
