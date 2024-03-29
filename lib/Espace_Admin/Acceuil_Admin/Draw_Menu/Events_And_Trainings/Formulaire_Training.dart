import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Events_Calendar.dart';


const Color darkBlue = Color.fromARGB(255, 219, 223, 226);

void main() {
  runApp(FormulaireMeeting());
}

// ignore: use_key_in_widget_constructors
class FormulaireMeeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: FlutterDatePickerExample());
  }
}

// ignore: use_key_in_widget_constructors
class FlutterDatePickerExample extends StatelessWidget {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 flexibleSpace: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: <Color>[
                // ignore: prefer_const_constructors
                Color.fromARGB(255, 14, 43, 173),
                // ignore: prefer_const_constructors
                Color.fromARGB(255, 135, 157, 255)
              ],
            ),
          ),
        ),        title: const Text('Training Calendar',style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
         leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CustomTableCalendar()));
            }),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              ' Create Event',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 48, 117, 182), fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingName, hint: 'Enter Event Name'),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingLink, hint: 'Enter Event Link'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Date From',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 48, 117, 182), fontWeight: FontWeight.bold),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: dateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            currentDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendar,
                            initialDatePickerMode: DatePickerMode.day,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color.fromARGB(255, 27, 92, 124),
                                      onSurface: Color.fromARGB(255, 148, 148, 148),
                                    )
                                ),
                                child: child!,
                              );
                            });
                        dateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? convertDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Time From',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 48, 117, 182), fontWeight: FontWeight.bold),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSubShort,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context)
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSubShort.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? convertTime(timeVal)
                          : ''));
                }),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              ' Date To',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 48, 117, 182), fontWeight: FontWeight.bold),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: longDateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context),
                                child: child!,
                              );
                            });
                        longDateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? longDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Time To',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 48, 117, 182), fontWeight: FontWeight.bold),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSub,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSub.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? timeVal.format(context)
                          : ''));
                }),
            const SizedBox(height: 20.0,),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Meeting Created'),
                duration: Duration(seconds: 5),));
            }, child: const Text('SUBMIT', 
             style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 17,
            )),
           style: ElevatedButton.styleFrom(shape:   RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                // ignore: prefer_const_constructors
                primary: Color.fromARGB(255, 47, 91, 214),),),
          ],
        ),
        ),
        
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String longDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyy').format(dateTime);
  }

  String convertTime(TimeOfDay timeOfDay) {
    DateTime tempDate = DateFormat('hh:mm').parse(
        timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString());
    var dateFormat = DateFormat('h:mm a');
    return dateFormat.format(tempDate);
  }


  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Color.fromARGB(255, 32, 32, 32), width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(
        Icons.calendar_today,
        color: Color.fromARGB(255, 48, 117, 182),
      ),
    );
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 32, 32, 32), width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 32, 32, 32), width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
 
}
 class AppColors {
  AppColors._();

  static const Color blackCoffee = Color(0xFF352d39);
  static const Color eggPlant = Color(0xFF6d435a);
  static const Color celeste = Color(0xFFb1ede8);
  static const Color babyPowder = Color(0xFFFFFcF9);
  static const Color ultraRed = Color(0xFFFF6978);
}




/*import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(FormulaireMeeting());
}

class FormulaireMeeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: FlutterDatePickerExample());
  }
}

class FlutterDatePickerExample extends StatelessWidget {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings Calendar', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
                  Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const CustomTableCalendar()));            }),
       ),
    
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              ' Create Meeting',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingName, hint: 'Enter Meeting Name'),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingLink, hint: 'Enter Meeting Link'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Date From ...',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: dateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            currentDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendar,
                            initialDatePickerMode: DatePickerMode.day,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.blueGrey,
                                      onSurface: AppColors.babyPowder,
                                    )
                                ),
                                child: child!,
                              );
                            });
                        dateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? convertDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Time From ...',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSubShort,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context)
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSubShort.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? convertTime(timeVal)
                          : ''));
                }),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              ' Date To ...',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: longDateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context),
                                child: child!,
                              );
                            });
                        longDateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? longDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Time To ...',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSub,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSub.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? timeVal.format(context)
                          : ''));
                }),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Meeting Created'),
                duration: Duration(seconds: 5),));
            }, child:
             const Text('SUBMIT',
             style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 71, 70, 68),
              fontSize: 16,
            )),
           style: ElevatedButton.styleFrom(
                // ignore: prefer_const_constructors
                primary: Color.fromARGB(255, 241, 241, 240),)
            ),
          ],
        ),
        ),
        
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String longDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyy').format(dateTime);
  }

  String convertTime(TimeOfDay timeOfDay) {
    DateTime tempDate = DateFormat('hh:mm').parse(
        timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString());
    var dateFormat = DateFormat('h:mm a');
    return dateFormat.format(tempDate);
  }


  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: AppColors.eggPlant, width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(
        Icons.calendar_today,
        color: AppColors.eggPlant,
      ),
    );
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
 
}
 class AppColors {
  AppColors._();

  static const Color blackCoffee = Color(0xFF352d39);
  static const Color eggPlant = Color(0xFF6d435a);
  static const Color celeste = Color(0xFFb1ede8);
  static const Color babyPowder = Color(0xFFFFFcF9);
  static const Color ultraRed = Color(0xFFFF6978);
}*/