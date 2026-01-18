import 'package:assignment_yum_yum_app/Pages/loginScreen.dart';
import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controllerslide, _controllerfade;
  late Animation<double> _fadeTransition;
  late Animation<Offset> _slideTransition;
  @override
  void initState() {
    _controllerslide = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _controllerfade = AnimationController(vsync: this, duration: Duration(milliseconds: 1));
    _fadeTransition = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerfade);
    _slideTransition = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -0.3),
    ).animate(CurvedAnimation(parent: _controllerslide, curve: Curves.easeIn));
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      _controllerslide.forward();
    });
    Future.delayed(Duration(seconds: 4),(){
      _controllerfade.forward();
      Future.delayed(Duration(seconds: 2),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(LogoApp: "assets/Yum, yum!.png")));
      });
    });

  }
  @override
  void dispose() {
    _controllerslide.dispose();
    _controllerfade.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height*0.8,
            width: size.width,
            child: Stack(
                children: [
                  SlideTransition(position: _slideTransition,child: Center(child: Image.asset("assets/Yum, yum!.png")),),
                  FadeTransition(opacity: _controllerfade,child: Center(child: CircularProgressIndicator(),),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(child: FadeTransition(opacity: _controllerfade,child: Text("Enjoy with your Food",style: TextStyle(color: Colors.white),),)),
                      Center(child: FadeTransition(opacity: _controllerfade,child: Text("Yum Yum",style: TextStyle(color: Colors.white),),)),
                    ],
                  )

                ],
            ),
          )
        ],
      ),
    );
  }
}
