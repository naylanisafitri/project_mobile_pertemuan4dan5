import 'package:flutter/material.dart';
import 'pertemuan_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  final List<Map<String, String>> data = const [
    {"title": "Pertemuan 1", "desc": "Pengenalan Android"},
    {"title": "Pertemuan 2", "desc": "Widget & Button"},
    {"title": "Pertemuan 3", "desc": "Activity & Intent"},
    {"title": "Pertemuan 4", "desc": "Toast & AlertDialog"},
    {"title": "Pertemuan 5", "desc": "ListView"},
    {"title": "Pertemuan 6", "desc": "Checkbox"},
    {"title": "Pertemuan 7", "desc": "Radio Button"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text(data[index]["title"]!),
              subtitle: Text(data[index]["desc"]!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PertemuanPage(
                      title: data[index]["title"]!,
                      desc: data[index]["desc"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}