import 'package:flutter/material.dart';
class DetailHomeScreen extends StatefulWidget {
  const DetailHomeScreen({super.key});

  @override
  State<DetailHomeScreen> createState() => _DetailHomeScreenState();
}

class _DetailHomeScreenState extends State<DetailHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
      ),
    );
  }
}
