import 'package:exercise_3/common/memory_store.dart';
import 'package:exercise_3/model/slot.dart';
import 'package:exercise_3/service/slot_service.dart';

class SlotService extends BaseSlotService {
  MemoryStore<Slot> slotStore = MemoryStore<Slot>();
  @override
  void addSlot(Slot slot) {
    slotStore.add(slot);
  }

  @override
  List<Slot> getSlots() {
    return slotStore.getItems();
  }

  @override
  void removeSlot(Slot slot) {
    slotStore.remove(slot);
  }
}
