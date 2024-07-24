import 'package:Diabo/pages/homepage.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final List<TimeOfDay> _alarms = []; // List to store alarms

  @override
  void initState() {
    super.initState();
   // _initializeNotifications();
  }

  //Future<void> _initializeNotifications() async {
  //  const AndroidInitializationSettings initializationSettingsAndroid =
   //     AndroidInitializationSettings('app_icon');
    //const InitializationSettings initializationSettings =
    //    InitializationSettings(android: initializationSettingsAndroid);
    //await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //}

  Future<void> _scheduleAlarm() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });

      final now = TimeOfDay.now();
      final selectedTime = _selectedTime;

      final nowInMinutes = now.hour * 60 + now.minute;
      final selectedTimeInMinutes =
          selectedTime.hour * 60 + selectedTime.minute;
      final difference = selectedTimeInMinutes - nowInMinutes;

      if (difference > 0) {
        //เสียง
        flutterLocalNotificationsPlugin.show(
          0,
          'Alarm',
          'Your alarm is set for ${_selectedTime.format(context)}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'alarm_channel',
              'Alarm Channel',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
            ),
          ),
        );

        // Add the alarm to the list and update the UI
        setState(() {
          _alarms.add(_selectedTime);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selected time is in the past')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 60, 101),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 40),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridViewPage()),
            );
          },
        ),
        title: const Text(
          'DiaBo',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _alarms.length,
                itemBuilder: (context, index) {
                  final alarmTime = _alarms[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 16.0), // Space around items
                        child: Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? const Color.fromARGB(255, 217, 245, 255)
                                : Color.fromARGB(
                                    255, 154, 117, 189), // Alternating colors
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          //child: ListTile(
                          //  //หน้าขึ้นว่ากี่โมง
                          //  leading: const Icon(Icons.alarm),
                          //  title: Text(
                          //      'Alarm set for: ${alarmTime.format(context)}'),
                          //  trailing: IconButton(
                          //    icon: const Icon(Icons.delete),
                          //    onPressed: () {
                          //      setState(() {
                          //        _alarms.removeAt(index);
                          //      });
                          //    },
                          //  ),
                          child: Container(
                            width: 1500,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10, left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.alarm),
                                        Text(
                                          "${alarmTime.format(context)}",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ]),
                                      Text("มื้อเช้า",
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scheduleAlarm,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // ปุ่มอยู่มุมขวาล่าง
    );
  }
}
