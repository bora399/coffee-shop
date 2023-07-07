import 'package:coffee_shop/pages/homepage.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:coffee_shop/utils/widget_functions.dart';
import 'package:coffee_shop/widgets/coffeecard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

bool espresso = false;
bool filtercoffee = false;
bool creamycoffee = false;
bool icedamericano = false;

class _IntroPage2State extends State<IntroPage2> {
  List<String> favoriteList = [];


  Future readyPreferences()async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen",true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        backgroundColor:COLOR_BG,
        body:Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top:65.0),
              child: Align(alignment:Alignment.center,child: Text("Choose Your Favorite Coffees!",style:TextStyle(color:COLOR_BLACK,fontSize: 22,fontWeight:FontWeight.w700))),
            ),
            addVerticalSpace(size.height/50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoffeeCard(title:"Espresso",imagetitle:"espresso"),  
                CoffeeCard(title:"Iced Americano",imagetitle:"icedamericano"),  
              ],
            ),
            addVerticalSpace(size.height/45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoffeeCard(title:"Filter Coffee",imagetitle:"filtercoffee"),  
                CoffeeCard(title:"Creamy Coffee",imagetitle:"creamycoffee"),  
              ],
            ),
            addVerticalSpace(size.height/14),
            Center(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(12.0),
                      color:const Color.fromARGB(255, 168, 159, 87),
                    ),
                    height:5,
                    width:8
                  ),
                  addHorizontalSpace(5),
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(25.0),
                      color:const Color.fromARGB(255, 40, 129, 43),
                    ),
                    height:5,
                    width:size.width/15,
                  ),
                ],
              ),
            ),
            addVerticalSpace(size.height/25),
            SizedBox(
              width:size.width/1.2,
              height:size.height/12,
              child: ElevatedButton(
                onPressed:()async{
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool("seen",true);
                  if(creamycoffee == true && !favoriteList.contains("Creamy Coffee")){
                    favoriteList.add("Creamy Coffee");
                    prefs.setBool("creamycoffee",true);
                  }
                  else if(espresso == true && !favoriteList.contains("Espresso")){
                    favoriteList.add("Espresso");
                    prefs.setBool("espresso",true);
                  }
                  else if(filtercoffee == true && !favoriteList.contains("Filter Coffee")){
                    favoriteList.add("Filter Coffee");
                    prefs.setBool("filtercoffee",true);
                  }
                  else if(icedamericano == true && !favoriteList.contains("Iced Americano")){
                    favoriteList.add("Iced Americano");
                    prefs.setBool("icedamericano",true);
                  }
                  // ignore: non_constant_identifier_names, avoid_types_as_parameter_names, use_build_context_synchronously
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext) => HomePage(favoriteList:favoriteList)));
                },
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 40, 129, 43)),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(35),
                    ),
                  )
                ),
                child:Text("Get Started",style:GoogleFonts.oxygen(color:COLOR_WHITE,fontSize:24,fontWeight:FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}