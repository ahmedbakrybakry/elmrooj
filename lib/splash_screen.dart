import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
children: [
  Container(
    padding: EdgeInsets.symmetric(vertical: 20,
    horizontal: 30,
    ),
    color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
IconButton(onPressed: (){}, icon: Container(
  width: 30,height: 40,
  color: Colors.amber,
  child: Icon(Icons.menu,color: Colors.white,),
)),
        
        Spacer(),
        Image.asset("",)
      ],
    ),
  )
],
        ),
      ),
    );
  }
}
