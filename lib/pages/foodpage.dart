import 'package:Diabo/pages/graph_food.dart';
import 'package:Diabo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:Diabo/pages/List_food.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  double _breakfastCarbs = 2;
  double _lunchCarbs = 3;
  double _dinnerCarbs = 1;
  double _snackCarbs = 0;

  double get _totalCarbs =>
      _breakfastCarbs + _lunchCarbs + _dinnerCarbs + _snackCarbs;

  void _navigateToList() {
    final DateTime now = DateTime.now();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => list(
          items: [
            {'date': now, 'carbs': _totalCarbs},
          ],
        ),
      ),
    );
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
        child: CircularPercentIndicatorWithListView(
          totalCarbs: _totalCarbs,
          breakfastCarbs: _breakfastCarbs,
          lunchCarbs: _lunchCarbs,
          dinnerCarbs: _dinnerCarbs,
          snackCarbs: _snackCarbs,
          onNavigateToList: _navigateToList,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.replay,
                size: 30,
              ),
              tooltip: "ประวัติการกิน Carbs",
              onPressed: _navigateToList,
            ),
            const SizedBox(width: 50.0),
            IconButton(
              icon: const Icon(
                Icons.equalizer,
                size: 40,
              ),
              tooltip: "กราฟประวัติการกิน Carbs",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Graph_food()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            child: const Icon(Icons.camera_alt, size: 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class CircularPercentIndicatorWithListView extends StatelessWidget {
  final double totalCarbs;
  final double breakfastCarbs;
  final double lunchCarbs;
  final double dinnerCarbs;
  final double snackCarbs;
  final VoidCallback onNavigateToList;

  CircularPercentIndicatorWithListView({
    required this.totalCarbs,
    required this.breakfastCarbs,
    required this.lunchCarbs,
    required this.dinnerCarbs,
    required this.snackCarbs,
    required this.onNavigateToList,
  });

  @override
  Widget build(BuildContext context) {
    double maxCarbs = 10; // ค่าของคาร์บแต่ละคน
    double percent =
        (totalCarbs / maxCarbs).clamp(0.0, 1.0); // คำนวณค่าเปอร์เซ็นต์

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 15.0, right: 200),
          child: const Text(
            "วันนี้ทาน Carbs ไปทั้งหมด...",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15), // เพิ่มระยะห่างจากขอบบน
          child: CircularPercentIndicator(
            radius: 95.0, // ขนาดของวงกลม
            lineWidth: 25.0, // ความหนาของเส้น
            percent: percent, // ค่าเปอร์เซ็นต์ (0.0 - 1.0)
            center: CustomPaint(
              painter: DividerPainter(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      totalCarbs.toInt().toString(), // ตัวเลขที่คำนวณ
                      style: const TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${maxCarbs.toInt().toString()}', // ตัวเลขเต็ม
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            progressColor:
                const Color.fromARGB(255, 89, 150, 230), // สีของความคืบหน้า
            backgroundColor:
                const Color.fromARGB(255, 199, 213, 221), // สีพื้นหลังของวงกลม
            circularStrokeCap: CircularStrokeCap.round, // รูปร่างของขอบเส้น
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 107, 106, 106),
          thickness: 0.5,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.free_breakfast),
                title: const Text('มื้อเช้า : '),
                trailing: Text("Carbs : $breakfastCarbs"),
                titleTextStyle: const TextStyle(fontSize: 23),
                leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
              ),
              const Divider(
                color: Color.fromARGB(255, 107, 106, 106),
                thickness: 0.5,
              ),
              ListTile(
                leading: const Icon(Icons.wb_sunny),
                title: const Text('มื้อเที่ยง : '),
                trailing: Text("Carbs : $lunchCarbs"),
                titleTextStyle: const TextStyle(fontSize: 23),
                leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
              ),
              const Divider(
                color: Color.fromARGB(255, 107, 106, 106),
                thickness: 0.5,
              ),
              ListTile(
                leading: const Icon(Icons.cloud),
                title: const Text('มื้อเย็น : '),
                trailing: Text("Carbs : $dinnerCarbs"),
                titleTextStyle: const TextStyle(fontSize: 23),
                leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
              ),
              const Divider(
                color: Color.fromARGB(255, 107, 106, 106),
                thickness: 0.5,
              ),
              ListTile(
                leading: const Icon(Icons.bakery_dining_rounded),
                title: const Text('อาหารว่าง : '),
                trailing: Text("Carbs : $snackCarbs"),
                titleTextStyle: const TextStyle(fontSize: 23),
                leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
              ),
              const Divider(
                color: Color.fromARGB(255, 107, 106, 106),
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // สีของเส้นแบ่ง
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // ความหนาของเส้นแบ่ง

    double radius = size.width / 2; // รัศมีของวงกลม
    double centerX = size.width / 2; // ตำแหน่ง X ของจุดศูนย์กลาง
    double centerY = size.height / 2; // ตำแหน่ง Y ของจุดศูนย์กลาง

    double lineLength = 60; // ความยาวของเส้นแบ่ง

    // วาดเส้นแบ่งครึ่ง
    canvas.drawLine(
      Offset(centerX - lineLength / 2, centerY), // จุดเริ่มต้นของเส้น
      Offset(centerX + lineLength / 2, centerY), // จุดสิ้นสุดของเส้น
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
