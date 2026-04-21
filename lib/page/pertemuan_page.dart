import 'package:flutter/material.dart';

class PertemuanPage extends StatelessWidget {
  final String title;
  final String desc;

  const PertemuanPage({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          desc,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}