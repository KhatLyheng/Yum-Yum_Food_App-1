import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_rounded,size: 40,color: Colors.white,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chhroy Chorngvar",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("Phnom Penh",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,size: 30,))
          ],
        ),
        backgroundColor: kbackgroundColor,
      ),
    );
  }
}
