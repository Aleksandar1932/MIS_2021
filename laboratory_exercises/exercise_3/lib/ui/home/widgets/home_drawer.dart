import 'package:exercise_3/service/auth_service.dart';
import 'package:exercise_3/service/impl/auth_service_impl.dart';
import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:exercise_3/ui/home/add_exam.dart';
import 'package:exercise_3/ui/wrapper.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final SlotService _slotService = SlotService();
  final BaseAuthService _authService = SimpleAuthService();

  void addSlot(var slot) {
    setState(() {
      _slotService.addSlot(slot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
          CircleAvatar(
            radius: 40,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          Text(_authService.getCurrentUser()!.identifier ?? "No User"),
          Divider(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSlot(addSlot: addSlot))),
                    },
                child: Row(
                  children: [Icon(Icons.add), Text("New Slot")],
                )),
          ),
          Positioned(
              bottom: 0,
              child: ElevatedButton(
                  onPressed: () => {
                        _authService.signOut(),
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => App())),
                      },
                  child: Text("Logout")))
        ],
      ),
    );
  }
}
