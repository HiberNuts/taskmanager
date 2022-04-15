import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/ui/theme.dart';
import 'package:taskmanager/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              MyInputField(title: "Title", hint: "Enter title here"),
              MyInputField(title: "Note", hint: "Enter Note here"),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(Icons.access_time_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(Icons.access_time_outlined),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) {
    var _pickedTime = _showTimePicker();
    String _formatedTime = _pickedTime.format.of(context);
    if (_pickedTime == null) {
      print("no TIme");
    } else if (isStartTime == true) {
      _startTime = _formatedTime;
    } else if (isStartTime == false) {
      _endTime = _formatedTime;
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 10),
    );
  }
}
