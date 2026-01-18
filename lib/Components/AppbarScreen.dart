import 'package:flutter/material.dart';
class AppbarScreen extends StatelessWidget {
  const AppbarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}