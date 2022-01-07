import 'package:exercise_3/model/slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddSlot extends StatefulWidget {
  const AddSlot({Key? key, required this.addSlot}) : super(key: key);
  final addSlot;
  @override
  _AddSlotState createState() => _AddSlotState();
}

class _AddSlotState extends State<AddSlot> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _roomIdController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: TextFormField(
                  controller: _roomIdController,
                  decoration: InputDecoration(labelText: 'Room ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a room ID';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: TextFormField(
                  controller: _latitudeController,
                  decoration: InputDecoration(labelText: 'Latitude'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter latitude';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: TextFormField(
                  controller: _longitudeController,
                  decoration: InputDecoration(labelText: 'Longitude'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter longitude';
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime:
                            DateTime.now().subtract(Duration(days: 365 * 3)),
                        maxTime: DateTime.now().add(Duration(days: 365 * 13)),
                        onChanged: (date) {
                      setState(() {
                        _date = date;
                      });
                    }, onConfirm: (date) {
                      setState(() {
                        _date = date;
                      });
                    }, currentTime: DateTime.now());
                  },
                  child: Text(
                    _date != null ? _date.toString() : "Select a Date",
                    style: TextStyle(color: Colors.blue),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            widget.addSlot(Slot(
                                description: _descriptionController.text,
                                location: _locationController.text,
                                roomId: _roomIdController.text,
                                startTime: _date ?? DateTime.now(),
                                position: LatLng(
                                    double.parse(_latitudeController.text),
                                    double.parse(_longitudeController.text)))),
                            Navigator.pop(context),
                            Navigator.pop(context)
                          }
                      },
                  child: Text("Add")),
            ],
          ),
        )));
  }
}
