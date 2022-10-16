import 'dart:async';
import 'package:google_map/domain/use_case/get_place_data_use_case.dart';
import 'package:google_map/presentation/controller/home_bloc.dart';
import 'package:google_map/presentation/controller/home_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/service_locator.dart';
import '../controller/home_event.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller= Completer();
  static const CameraPosition _kGooglePlex=
  CameraPosition(
      target: LatLng(30.033333, 31.233334),
    zoom: 14.4764,

  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.4666648 ,31.1833326),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);



static final Marker _googlePlexMarker= Marker(
    markerId: MarkerId('_kGooglePlex'),
  infoWindow: InfoWindow(title: 'Google Plex'),
  icon: BitmapDescriptor.defaultMarker,
  position:  LatLng(30.033333, 31.233334)

);
  static final Marker _benhaPlexMarker= Marker(
      markerId: MarkerId('_kBenhaPlex'),
      infoWindow: InfoWindow(title: 'Benha Plex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position:  LatLng(30.053533, 31.233388)

  );

  static final polyLine =Polyline(
      polylineId: PolylineId('_kPolyLine'),
    points: [
      LatLng(30.033333, 31.233334),
      LatLng(30.053533, 31.233388)
    ],
    width: 5,
    color: Colors.blue

  );

  static final  Polygon _kPolygon=Polygon(
      polygonId: PolygonId("_kPolygon"),
    points: [
      LatLng(30.033333, 31.233334),
      LatLng(30.053533, 31.233388),
      LatLng(30.043333,31.333388 ),
      LatLng(30.053333,31.333388 ),
    ],
    strokeWidth: 5,

  );
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title:const Text("Google Map"),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: "Search By City",

                        ),
                        onChanged: (value){
                          print(value);
                        },
                      ),
                    ),
                    IconButton(onPressed: (){
                      sl<HomeBloc>().add(GetPlaceIdEvent(searchController.text));
                    }, icon: const Icon(Icons.search))
                  ],
                ),
                Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    markers: {
                      _googlePlexMarker,
                      _benhaPlexMarker},
                    // polylines: {
                    //   polyLine
                    // },
                    // polygons:{
                    //   _kPolygon
                    // } ,
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    },

                  ),
                ),
              ],
            ),
            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: _goToTheLake,
            //   icon:const Icon(Icons.directions_boat),
            //   label: const Text("To The Lake"),
            //
            // ),
          );
        },
      ),

    );


  }
  Future<void> _goToTheLake() async{
    final GoogleMapController controller=await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
