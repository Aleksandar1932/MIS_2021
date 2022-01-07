import 'package:exercise_3/model/slot.dart';
import 'package:exercise_3/service/impl/slot_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime? focusedDay;
  final SlotService _slotService = SlotService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  List<Slot> slots = [];

  final AndroidNotificationDetails _androidNotificationDetails =
      const AndroidNotificationDetails(
    'chanel_id',
    'channel_name',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/launch_background'),
      ),
  );
    focusedDay = DateTime.now();
    slots = _slotService.getSlots();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      slots = _slotService
          .getSlots()
          .where((element) => element.startTime.day == focusedDay?.day)
          .toList();
    });

    if (slots.isNotEmpty) {
      flutterLocalNotificationsPlugin.show(
        1,
        "Exams for: ${focusedDay?.day}/${focusedDay?.month}/${focusedDay?.year}",
        slots.length.toString(),
        NotificationDetails(android: _androidNotificationDetails),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focusedDay ?? DateTime.now(),
          selectedDayPredicate: (day) => focusedDay == day,
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            setState(() {
              this.focusedDay = selectedDay;
            });
          },
        ),
        Text(
          "Exams for: ${focusedDay?.day}/${focusedDay?.month}/${focusedDay?.year}",
          style: TextStyle(fontSize: 24),
        ),
        Divider(),
        Expanded(
          child: slots.length > 0
              ? ListView.separated(
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
                )
              : Center(
                  child: Text(
                  "No exams for this day",
                  style: TextStyle(fontSize: 26),
                )),
        )
      ],
    );
  }
}
