import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class list extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  list({required this.items});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<list> {
  late List<Map<String, dynamic>> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _items.sort(
        (a, b) => b['date'].compareTo(a['date'])); // เรียงลำดับจากใหม่ไปเก่า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
              child: Text(
                'ประวัติการรับประทาน Carbs',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 1)),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final formattedDate =
                    DateFormat('dd/MM/yyyy').format(item['date']);
                return ListTile(
                  title: Text(
                    '   $formattedDate                                         Carbs = ${item['carbs']}',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
