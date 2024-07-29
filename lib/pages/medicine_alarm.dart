import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AlarmScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<DateTime> alarms = [];

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            'app_icon'); // ให้แน่ใจว่ามีไอคอนชื่อ 'app_icon' ในไดเร็กทอรี android/app/src/main/res/drawable

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones(); // เริ่มต้น timezone
  }

  Future<void> scheduleNotification(DateTime scheduledTime) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      //'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      alarms.length, // Use alarms.length to avoid overwriting notifications
      'Scheduled Notification',
      'This is a notification scheduled to show at a specific time.',
      tz.TZDateTime.from(scheduledTime, tz.local),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    setState(() {
      alarms.add(scheduledTime);
    });
  }

  void _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        final DateTime scheduledDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        scheduleNotification(scheduledDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 60, 101),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 40),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.pop(context);
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  final formattedDate = DateFormat('yyyy-MM-dd').format(alarm);
                  final formattedTime = DateFormat('HH:mm').format(alarm);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.blue.shade100
                          : Colors.blue.shade50, // สีสลับกันในแต่ละรายการ
                      border: Border.all(
                        color: Colors.blue.shade900, // สีของกรอบ
                        width: 2, // ความหนาของกรอบ
                      ),
                      borderRadius: BorderRadius.circular(10), // มุมโค้งของกรอบ
                    ),
                    child: ListTile(
                      title: Text(
                        'Alarm ${index + 1}',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '$formattedDate $formattedTime',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickDateTime,
          child: Icon(Icons.add_alarm),
          tooltip: 'Schedule Notification',
        ),
      ),
    );
  }
}
