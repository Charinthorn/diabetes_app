import 'package:Diabo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Graph> {
  int _selectedIndex = 0; // ตัวแปรที่เก็บ index ของแท็บที่เลือก

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Container(
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 25, right: 130),
              child: const Text('กราฟแสดงข้อมูลจากใบผลตรวจ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 2, 66, 119),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start),
            ),
            Container(
              padding: const EdgeInsets.only(left: 380),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.square,
                          color: Color.fromARGB(255, 97, 131, 216)),
                      Text("ค่าน้ำตาล"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.square,
                          color: Color.fromARGB(255, 223, 87, 87)),
                      Text("ค่าLDL"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 30),
              width: 500, // กำหนดความกว้างของกราฟ
              height: 350, // กำหนดความสูงของกราฟ
              child: LineChartSample(),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.only(right: 300),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 2, 66, 119))),
                onPressed: () {},
                icon: Icon(Icons.print,
                    color: Color.fromARGB(
                        255, 255, 255, 255)), //icon data for elevated button
                label: Text("PRINT",
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                //label text
              ),
            )
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Container(
          height: 100.0,
          width: 100.0,
          padding: const EdgeInsets.only(bottom: 30),
          child: FittedBox(
            child: FloatingActionButton(
                tooltip: "สแกนใบตรวจ",
                child: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                backgroundColor: const Color.fromARGB(255, 2, 66, 119),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)), //ความกลมของปุ่ม
                onPressed: () {}),
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
            drawHorizontalLine: true, drawVerticalLine: false), //กริด
        titlesData: FlTitlesData(
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
        ), //ข้อความรอบกรอบ
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 2,
            ),
            left: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 2,
            ),
            //top: BorderSide(
            //  color: Color.fromARGB(255, 0, 0, 0),
            //  width: 2,
            //),
            //right: BorderSide(
            //  color: Color.fromARGB(255, 0, 0, 0),
            //  width: 2,
            //),
          ),
        ), //เส้นกรอบ
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 8,
        lineBarsData: [
          LineChartBarData(
            spots: [
               FlSpot(0, 3),
               FlSpot(1, 1),
               FlSpot(2, 4),
               FlSpot(3, 2),
               FlSpot(4, 5),
               FlSpot(5, 3),
               FlSpot(6, 4),
            ],

            colors: [const Color.fromARGB(255, 97, 131, 216)], //สีเส้นกราฟ
            barWidth: 3, //ความหนาเส้นกราฟ
            isStrokeCapRound: false,
            dotData: FlDotData(show: true), //จุดบนกราฟ
            belowBarData: BarAreaData(show: false), //สีใต้กราฟ
          ),
          LineChartBarData(
            spots: [
               FlSpot(0, 6),
               FlSpot(1, 5),
               FlSpot(2, 2),
               FlSpot(3, 3),
               FlSpot(4, 4),
               FlSpot(5, 4),
               FlSpot(6, 5),
            ],

            colors: [const Color.fromARGB(255, 223, 87, 87)], //สีเส้นกราฟ
            barWidth: 3, //ความหนาเส้นกราฟ
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ), //จุดบนกราฟ
            belowBarData: BarAreaData(show: false), //สีใต้กราฟ
          ),
        ],
      ),
    );
  }
}
