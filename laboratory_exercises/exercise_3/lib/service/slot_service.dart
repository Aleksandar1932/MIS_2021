import 'package:exercise_3/model/slot.dart';

abstract class BaseSlotService {
  void addSlot(Slot slot);
  void removeSlot(Slot slot);
  List<Slot> getSlots();
}
