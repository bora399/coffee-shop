import 'package:coffee_shop/pages/homepage.dart';
import 'package:coffee_shop/pages/intropage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash>{
  Future checkFirstSeen()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ?seen = (prefs.getBool("seen"));
    if(seen == false && mounted){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder:(context)=>HomePage(favoriteList:const []))
      );
    }
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder:(context)=>const IntroPage())
      );
    }
  }


  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child:  Text('Loading...'),
      ),
    );
  }


  

}