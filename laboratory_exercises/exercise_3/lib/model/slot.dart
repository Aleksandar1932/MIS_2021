import 'package:google_maps_flutter/google_maps_flutter.dart';

class Slot {
  String description;
  String location;
  String roomId;
  DateTime startTime;
  LatLng? position;

  Slot({
    required this.description,
    required this.location,
    required this.roomId,
    required this.startTime,
    this.position
  });
}
