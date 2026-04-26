import 'package:flutter/material.dart';
import 'package:project_mobile/page/list_page.dart';
import 'package:project_mobile/pertemuan/pertemuan6checkbox.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  final List<Map<String, dynamic>> menu = const [
    {'title': 'Pertemuan 5', 'color': Colors.blue},
    {'title': 'Pertemuan 6', 'color': Colors.green},
    {'title': 'Pertemuan 7', 'color': Colors.orange},
    {'title': 'Pertemuan 8', 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            String title = menu[index]['title'];

            return GestureDetector(
              onTap: () {
                if (title == 'Pertemuan 5') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListPage(),
                    ),
                  );
                } else if (title == 'Pertemuan 6') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pertemuan6Checkbox(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title belum tersedia'),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book,
                      size: 50,
                      color: menu[index]['color'],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}