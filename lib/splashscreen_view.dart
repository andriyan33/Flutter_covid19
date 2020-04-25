import 'package:covid19/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:covid19/main.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState(){
    super.initState();
    startSplasScreen();
  }

  startSplasScreen() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute (builder: (_){
          return Home();
        }),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 19, 147, 70),
      body: Center(
        child: Image.asset(
          "images/virus.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}