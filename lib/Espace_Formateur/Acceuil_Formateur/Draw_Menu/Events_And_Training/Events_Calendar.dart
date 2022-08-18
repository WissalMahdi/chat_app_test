// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_constructors, sized_box_for_whitespace

import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/UI_Espace_Apprenant.dart';
import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/UI_Espace_Formateur.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key? key}) : super(key: key);

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  final todaysDate = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 223, 226),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: <Color>[
                Color.fromARGB(255, 14, 43, 173),
                Color.fromARGB(255, 135, 157, 255)
              ],
            ),
          ),
        ),
        title: const Text('Events & Trainings Calendar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EspaceFormateur()));
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Color.fromARGB(255, 195, 195, 207),
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(
                    color: Color.fromARGB(255, 34, 34, 36), width: 2.0),
              ),
              child: TableCalendar(
                focusedDay: _focusedCalendarDate,
                // today's date
                firstDay: _initialCalendarDate,
                // earliest possible date
                lastDay: _lastCalendarDate,
                // latest allowed date
                calendarFormat: CalendarFormat.month,
                // default view when displayed
                // default is Saturday & Sunday but can be set to any day.
                // instead of day number can be mentioned as well.
                weekendDays: const [DateTime.sunday, 6],
                // default is Sunday but can be changed according to locale
                startingDayOfWeek: StartingDayOfWeek.monday,
                // height between the day row and 1st date row, default is 16.0
                daysOfWeekHeight: 40.0,
                // height between the date rows, default is 52.0
                rowHeight: 60.0,
                // this property needs to be added if we want to show events
                eventLoader: _listOfDayEvents,
                // Calendar Header Styling
                headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(151, 74, 96, 138),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  formatButtonTextStyle: TextStyle(
                      color: Color.fromARGB(255, 102, 36, 255), fontSize: 16.0),
                  formatButtonDecoration: BoxDecoration(
                    color: AppColors.babyPowder,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: AppColors.babyPowder,
                    size: 28,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: AppColors.babyPowder,
                    size: 28,
                  ),
                ),
                // Calendar Days Styling
                daysOfWeekStyle: const DaysOfWeekStyle(
                  // Weekend days color (Sat,Sun)
                  weekendStyle:
                      TextStyle(color: Color.fromARGB(255, 56, 36, 235)),
                ),
                // Calendar Dates styling
                calendarStyle: const CalendarStyle(
                  // Weekend dates color (Sat & Sun Column)
                  weekendTextStyle:
                      TextStyle(color: Color.fromARGB(255, 55, 52, 207)),
                  // highlighted color for today
                  todayDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 31, 199),
                    shape: BoxShape.circle,
                  ),
                  // highlighted color for selected day
                  selectedDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 92, 131, 214),
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 67, 85, 163),
                      shape: BoxShape.circle),
                ),
                selectedDayPredicate: (currentSelectedDate) {
                  // as per the documentation 'selectedDayPredicate' needs to determine
                  // current selected day
                  return (isSameDay(
                      selectedCalendarDate!, currentSelectedDate));
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // as per the documentation
                  if (!isSameDay(selectedCalendarDate, selectedDay)) {
                    setState(() {
                      selectedCalendarDate = selectedDay;
                      _focusedCalendarDate = focusedDay;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250, bottom: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 130, bottom: 16),
              child: Text(
                'Date Event : 20/10/2022 ',
                style: TextStyle(
                    color: Color.fromARGB(255, 46, 14, 228),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 72, bottom: 16),
              child: Text(
                'Event Title : Formation Electricité',
                style: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 62, bottom: 8.0),
              child: Text(
                'Description : Electricité et Batiment',
                style: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: Color.fromARGB(255, 83, 83, 83),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250, bottom: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 130, bottom: 16),
              child: Text(
                'Date Event : 30/11/2022 ',
                style: TextStyle(
                    color: Color.fromARGB(255, 46, 14, 228),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 55, bottom: 16),
              child: Text(
                'Event Title : Formation Mécatronique',
                style: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 8.0),
              child: Text(
                'Description : Electronique et Mécanique',
                style: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 90),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyEvents {
  final String eventTitle;
  final String eventDescp;

  MyEvents({required this.eventTitle, required this.eventDescp});

  @override
  String toString() => eventTitle;
}

class AppColors {
  AppColors._();

  static const Color blackCoffee = Color(0xFF352d39);
  static const Color eggPlant = Color(0xFF6d435a);
  static const Color celeste = Color(0xFFb1ede8);
  static const Color babyPowder = Color(0xFFFFFcF9);
  static const Color ultraRed = Color(0xFFFF6978);
}
