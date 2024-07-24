import 'package:Diabo/pages/homepage.dart';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  final List<String> items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 60, 101),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,size: 40),
            color: Color.fromARGB(255, 255, 255, 255), 
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
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100, // กำหนดความกว้าง
                height: 200, // กำหนดความสูง
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? Colors.blue[100]
                      : Colors.green[100], // กำหนดสีพื้นหลังสลับกัน
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  //รับค่าจากocr
                  title: Text('${items[index]}'),
                  subtitle: Text('Subtitle 2'),
                  onTap: () {
                    // ทำงานเมื่อคลิก ListTile
                    print('Album tapped');
                  },
                  trailing: IconButton(
                    //ถังขยะ
                    icon: Icon(Icons.delete),
                    color: const Color.fromARGB(255, 222, 94, 85),
                    onPressed: () {
                      // ทำงานเมื่อกดไอคอนถังขยะ
                      print('Delete ${items[index]}');
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
