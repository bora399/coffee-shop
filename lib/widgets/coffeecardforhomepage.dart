import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoffeeCard2 extends StatefulWidget {
  CoffeeCard2({super.key,required this.title,required this.imagetitle});
  String title;
  String imagetitle;

  @override
  State<CoffeeCard2> createState() => _CoffeeCard2State();
}

class _CoffeeCard2State extends State<CoffeeCard2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left:12.0,top:12.0),
      child: Container(
        width:size.width/2.5,
        height:size.height/5.8,
        decoration:BoxDecoration(
          color:COLOR_COFFEE_CARD,
          borderRadius:BorderRadius.circular(12.0),
        ),
        child:Column(
          children:[
            FittedBox(
              child:Image.asset("assets/images/${widget.imagetitle}.png",height:size.height/8,)
            ),
            Padding(
              padding:const EdgeInsets.only(top:6.0,left:6.0),
              child:Text(widget.title,style:const TextStyle(fontWeight: FontWeight.w600,color:COLOR_BLACK))
            ),
          ],
        ),
      ),
    );
  }
}