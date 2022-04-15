import 'package:date_picker_timeline/date_picker_widget.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/services/notification_services.dart';
import 'package:taskmanager/services/theme_services.dart';
import "package:intl/intl.dart";
import 'package:taskmanager/ui/theme.dart';
import 'package:taskmanager/ui/widgets/add_task_bar.dart';
import 'package:taskmanager/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 0),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.grey[500]),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(
                    DateTime.now(),
                  ),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(
              label: "+ Add Task", onTap: () => Get.to(const AddTaskPage()))
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body:
                Get.isDarkMode ? "Activated Light Mode" : "Activated Dark Mode",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
