import 'package:Diabo/main.dart';
import 'package:Diabo/pages/appointment_doctor.dart';
import 'package:Diabo/pages/foodpage.dart';
import 'package:Diabo/pages/graph_lab.dart';
import 'package:Diabo/pages/medicine_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Diabo/data.dart';
import 'package:Diabo/model/category.dart';
import 'package:Diabo/pages/login_screen.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage>
    with TickerProviderStateMixin {
  int _selectedDestination = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    List<Category> _list = FakeData().categoriesList;
    final theme = Theme.of(context);

    return Scaffold(
      //textDirection: TextDirection.ltr,
      //child: Scaffold(
      appBar: AppBar(
        title: const Text("Diabo"),
        backgroundColor: const Color.fromARGB(255, 30, 30, 124),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255), size: 30),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'น้องแมวดำ',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
              ),
              accountEmail: Text(
                '@gmail.com',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13.5),
              ),

              currentAccountPicture: CircleAvatar(
                maxRadius: 30,
                child: FlutterLogo(
                  size: 40.0,
                ),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),

              //padding: const EdgeInsets.only(top:100,bottom: 100,left: 50,right: 50),
              //child: Text(
              //  "Image",

              //  textAlign: TextAlign.center,
              //),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 105, 142),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.badge), //create badge
              title: const Text("แก้ไขข้อมูลส่วนตัว"),
              //selected: _selectedDestination == 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Food()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chrome_reader_mode),
              title: const Text("คู่มือ"),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            )
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 30, horizontal: 7), //แนวตั้งนอนก่อนปุ่ม
        child: AnimationLimiter(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10, // ช่องว่างระหว่างคอลัมน์
                  mainAxisSpacing: 10, // ช่องว่างระหว่างแถว
                ),
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: 2,
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        delay: const Duration(milliseconds: 100),
                        child: InkWell(
                          onTap: () {
                            //กดละไปหน้าอื่น
                            if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Graph(),
                                ),
                              );
                            } else if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Doctor(),
                                ),
                              );
                            } else if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Food(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  AlarmScreen(),
                                ),
                              );
                            }
                          },
                          child: listItem(_list[index]),
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}

Widget listItem(Category category) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1000,
            height: 250,
            padding: const EdgeInsets.all(2),
            child: Image.asset(category.image), //ขนาดรูป
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28),
          )
        ],
      ));
}
