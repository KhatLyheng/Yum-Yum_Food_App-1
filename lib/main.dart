import 'package:assignment_yum_yum_app/Components/mainScreen.dart';
import 'package:assignment_yum_yum_app/Pages/splashScreen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MainScreen());
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreenApp(),
    );
  }
}

