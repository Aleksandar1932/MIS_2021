import 'package:exercise_3/model/slot.dart';
import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void populateSlots() {
  final SlotService _slotService = SlotService();

  _slotService.addSlot(Slot(
      description: "Calculus 1 Exam",
      location: "Building 1",
      roomId: "201",
      startTime: DateTime.utc(2022, 1, 1, 9, 0),
      position: LatLng(41.4378, 22.6427)));
  _slotService.addSlot(Slot(
      description: "Web Based Systems Midterm",
      location: "Building 2",
      roomId: "UIA1",
      startTime: DateTime.utc(2022, 1, 2, 9, 0),
      position: LatLng(41.44, 22.65)));
  _slotService.addSlot(Slot(
      description: "Algorithms and Datastructures Exam",
      location: "Campus Y",
      roomId: "LAB-02",
      startTime: DateTime.utc(2022, 1, 2, 9, 0),
      position: LatLng(41.4422, 22.65111)));

  _slotService.addSlot(Slot(
      description: "Mobile Development Midterm",
      location: "Co-Building 120",
      roomId: "MM01-P",
      startTime: DateTime.utc(2022, 1, 6, 9, 0),
      position: LatLng(41.43999, 22.64999)));
}
