import 'package:assignment_yum_yum_app/Components/Login_Screens/Login_Screen.dart';
import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.logoYum});
  final  logoYum;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    _fadeAnimation = Tween(
      begin: 0.1,
      end: 0.1,
    ).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0,-0.1),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut,)
    );
    _controller.forward();
    Future.delayed(Duration(milliseconds: 3000),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen(LogoApp: "assets/Yum, yum!.png",)));
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(
        child: Container(
          height: size.height*0.5,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideTransition(
                  position: _slideAnimation,
                  child: Image.asset(widget.logoYum,)),
               CircularProgressIndicator(),
              Column(
                children: [
                  Text("Enjoy your Food With ",style: TextStyle(fontSize: 20,color: Colors.white),),
                  Text("Yum!",style: TextStyle(fontSize: 20,color: Colors.white),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
