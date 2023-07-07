import 'package:coffee_shop/pages/intropage2.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:coffee_shop/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  Future<void> saveData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("seen",true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        backgroundColor:COLOR_BG,
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Center(child: Image.asset("assets/images/assetcoffee.jpg",scale: 0.75,)),
            ),
            Center(child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:21.0),
                  child: Text("Coffee so good, your taste buds   will love it",style:GoogleFonts.oxygen(textStyle:const TextStyle(color:Colors.black,fontWeight:FontWeight.w700,fontSize:36)),textAlign:TextAlign.center),
                ),
                addVerticalSpace(size.height/35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:21.0),
                  child: Text("The best grain, the finest roast, the most powerful flavor",style:GoogleFonts.oxygen(textStyle:const TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:14)),textAlign:TextAlign.center),
                ),
              ],
            )
            ),
            addVerticalSpace(size.height/20),
            Center(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(12.0),
                      color:const Color.fromARGB(255, 40, 129, 43),
                    ),
                    height:5,
                    width:size.width/15
                  ),
                  addHorizontalSpace(5),
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(25.0),
                      color:const Color.fromARGB(255, 168, 159, 87),
                    ),
                    height:5,
                    width:8
                  ),
                ],
              ),
            ),
            addVerticalSpace(size.height/17),
            SizedBox(
              width:size.width/1.2,
              height:size.height/12,
              child: ElevatedButton(
                onPressed:(){
                  saveData();
                  // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(BuildContext) => const IntroPage2()));
                },
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 40, 129, 43)),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(35),
                    ),
                  )
                ),
                child:Text("Choose Your Favorites",style:GoogleFonts.oxygen(color:COLOR_WHITE,fontSize:24,fontWeight:FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}