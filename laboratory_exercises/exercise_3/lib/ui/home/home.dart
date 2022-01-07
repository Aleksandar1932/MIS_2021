import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:exercise_3/ui/home/map_view.dart';
import 'package:exercise_3/ui/home/widgets/calendar_view.dart';
import 'package:exercise_3/ui/home/widgets/home_drawer.dart';
import 'package:exercise_3/utils/bootstrap.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SlotService _slotService = SlotService();
  DateTime? focusedDay;

  int _selectedIndex = 0;
  var _widgetOptions = <Widget>[CalendarView(), MapSample()];

  @override
  void initState() {
    super.initState();
    populateSlots();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HomeDrawer(),
      body: IndexedStack(children: _widgetOptions, index: _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
