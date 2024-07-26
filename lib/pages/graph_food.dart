import 'package:Diabo/pages/foodpage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph_food extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Graph_food> with TickerProviderStateMixin {
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
                MaterialPageRoute(builder: (context) => Food()),
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
              padding: const EdgeInsets.only(top: 25, right: 40),
              child:
                  const Text('กราฟแสดงข้อมูลการรับประทานCarbs 14 วันที่ผ่านมา',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 2, 66, 119),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(right: 30),
              width: 800, // กำหนดความกว้างของกราฟ
              height: 250, // กำหนดความสูงของกราฟ
              child: LineChartSample1(),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: const Text(
                  'กราฟแสดงข้อมูลเฉลี่ยการรับประทานCarbs 1 เดือนที่ผ่านมา',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 2, 66, 119),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(right: 30),
              width: 1000, // กำหนดความกว้างของกราฟ
              height: 250, // กำหนดความสูงของกราฟ
              child: LineChartSample2(),
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Container(
          height: 90.0,
          width: 90.0,
          padding: const EdgeInsets.only(bottom: 30),
          child: FittedBox(
            child: FloatingActionButton(
                tooltip: "พิมพ์กราฟทั้งหมด",
                child: const Icon(
                  Icons.print,
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

class LineChartSample1 extends StatelessWidget {
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
        maxX: 14,
        minY: 0,
        maxY: 10,
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
              FlSpot(7, 6),
              FlSpot(8, 3),
              FlSpot(9, 1),
              FlSpot(10, 4),
              FlSpot(11, 3),
              FlSpot(12, 4),
              FlSpot(13, 2),
              FlSpot(14, 5),
            ],

            colors: [const Color.fromARGB(255, 97, 131, 216)], //สีเส้นกราฟ
            barWidth: 2, //ความหนาเส้นกราฟ
            isStrokeCapRound: true,
            dotData: FlDotData(show: false), //จุดบนกราฟ
            belowBarData: BarAreaData(show: false), //สีใต้กราฟ
          ),
        ],
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
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
          ),
        ), //เส้นกรอบ
        minX: 0,
        maxX: 4,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 2),
              FlSpot(4, 5),
            ],

            colors: [const Color.fromARGB(255, 97, 131, 216)], //สีเส้นกราฟ
            barWidth: 2, //ความหนาเส้นกราฟ
            isStrokeCapRound: true,
            dotData: FlDotData(show: false), //จุดบนกราฟ
            belowBarData: BarAreaData(show: false), //สีใต้กราฟ
          ),
        ],
      ),
    );
  }
}
