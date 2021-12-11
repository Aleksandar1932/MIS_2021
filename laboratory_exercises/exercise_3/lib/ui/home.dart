import 'package:exercise_3/model/slot.dart';
import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:exercise_3/ui/add_exam.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCSE Exam Scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FCSE Exam Scheduler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SlotService _slotService = SlotService();
  int _counter = 0;

  void addSlot(var slot) {
    setState(() {
      _slotService.addSlot(slot);
    });
  }

  @override
  void initState() {
    super.initState();

    _slotService.addSlot(Slot(
        description: "Calculus 1 Exam",
        location: "Building 1",
        roomId: "201",
        startTime: DateTime.now()));
    _slotService.addSlot(Slot(
        description: "Web Based Systems Midterm",
        location: "Building 2",
        roomId: "UIA1",
        startTime: DateTime.now()));
    _slotService.addSlot(Slot(
        description: "Algorithms and Datastructures Exam",
        location: "Campus Y",
        roomId: "LAB-02",
        startTime: DateTime.now()));
    _slotService.addSlot(Slot(
        description: "Mobile Development Midterm",
        location: "Co-Building 120",
        roomId: "MM01-P",
        startTime: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    List<Slot> slots = _slotService.getSlots();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            CircleAvatar(
              radius: 40,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text("Aleksandar Ivanovski"),
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
                                builder: (context) =>
                                    AddSlot(addSlot: addSlot))),
                      },
                  child: Row(
                    children: [Icon(Icons.add), Text("New Slot")],
                  )),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: slots.length,
              itemBuilder: (BuildContext context, int index) {
                var currentSlot = slots[index];
                return Container(
                  height: 50,
                  child: Column(children: [
                    Text(
                      currentSlot.description,
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(children: [
                      Text(currentSlot.location),
                      VerticalDivider(
                        width: 10,
                      ),
                      Text(currentSlot.startTime.toString()),
                      VerticalDivider(
                        width: 10,
                      ),
                      Text(currentSlot.roomId),
                      VerticalDivider(
                        width: 10,
                      ),
                    ])
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          )
        ],
      ),
    );
  }
}
