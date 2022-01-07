import 'dart:async';

import 'package:exercise_3/model/slot.dart';
import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:exercise_3/utils/acquire_position.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final SlotService _slotService = SlotService();
  List<Slot> slots = [];
  
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition? _currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {
      slots = _slotService.getSlots();
      _markers = slots
      .where((slot) => slot.position != null)
      .map((slot) => Marker(
        markerId: MarkerId(slot.description.hashCode.toString()),
        position: slot.position!,
        infoWindow: InfoWindow(title: slot.description),
      )).toSet();
    });
    // Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    determinePosition()
        .then((position) => setState(() => {
              _currentLocation = CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 15),
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.terrain,
        initialCameraPosition: _currentLocation!,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      )
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation!));
  }
}
