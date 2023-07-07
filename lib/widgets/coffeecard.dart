import 'package:coffee_shop/pages/intropage2.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoffeeCard extends StatefulWidget {
  CoffeeCard({super.key,required this.title,required this.imagetitle});
  String title;
  String imagetitle;

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left:12.0,top:12.0),
      child: Container(
        width:size.width/2.5,
        height:size.height/4.5,
        decoration:BoxDecoration(
          color:COLOR_COFFEE_CARD,
          borderRadius:BorderRadius.circular(12.0),
        ),
        child:Column(
          children:[
            Padding(
              padding:const EdgeInsets.only(top:6.0,left:6.0),
              child:Text(widget.title,style:const TextStyle(fontWeight: FontWeight.w600,color:COLOR_BLACK))
            ),
            FittedBox(
              child:Image.asset("assets/images/${widget.imagetitle}.png",height:size.height/8,)
            ),
            ElevatedButton(
              onPressed:(){
                widget.imagetitle=="espresso"?espresso=true:espresso=false;
                widget.imagetitle=="icedamericano"?icedamericano=true:icedamericano=false;
                widget.imagetitle=="filtercoffee"?filtercoffee=true:filtercoffee=false;
                widget.imagetitle=="creamycoffee"?creamycoffee=true:creamycoffee=false;
              },
              style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 123, 85, 27)),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(35),
                    ),
                  )
                ),
              child:const Text("Love This"),
            ),
          ],
        ),
      ),
    );
  }
}