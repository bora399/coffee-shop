import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:coffee_shop/utils/widget_functions.dart';
import 'package:coffee_shop/widgets/coffeecardforhomepage.dart';
import 'package:flutter/material.dart';

import 'favoritepage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  List<String> favoriteList;
  HomePage({super.key, required this.favoriteList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0, left: 26.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 28.0,
                              backgroundColor: COLOR_LOGO_BG,
                              child: Icon(Icons.person, color: COLOR_WHITE),
                            ),
                            addHorizontalSpace(size.width / 7),
                            const Icon(Icons.location_pin, color: COLOR_ICON),
                            const Text("Tekirdag",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            const Text(" ,Turkiye",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            addHorizontalSpace(size.width / 6),
                            const Icon(Icons.notifications_none)
                          ],
                        ),
                      ),
                      addVerticalSpace(18),
                      const Padding(
                        padding: EdgeInsets.only(left: 26.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Good Morning, Bora",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22))),
                      ),
                      addVerticalSpace(size.height / 30),
                      Center(
                        child: Container(
                          width: size.width / 1.3,
                          height: size.height / 15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 214, 214),
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: Icon(Icons.search)),
                              addHorizontalSpace(10),
                              const Text("Search Coffee"),
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(size.height / 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 26.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Coffees",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18))),
                      ),
                      addVerticalSpace(6),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                        child: CarouselSlider(
                          items: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: CoffeeCard2(
                                    imagetitle: "espresso", title: "Espresso")),
                            Align(
                                alignment: Alignment.topLeft,
                                child: CoffeeCard2(
                                    imagetitle: "icedamericano",
                                    title: "Iced Americano")),
                            Align(
                                alignment: Alignment.topLeft,
                                child: CoffeeCard2(
                                    imagetitle: "filtercoffee",
                                    title: "Filter Coffee")),
                            Align(
                                alignment: Alignment.topLeft,
                                child: CoffeeCard2(
                                    imagetitle: "creamycoffee",
                                    title: "Creamy Coffee")),
                          ],
                          options: CarouselOptions(
                            height: size.height / 5,
                            viewportFraction: 0.5,
                            //autoPlay:true,
                          ),
                        ),
                      ),
                      addVerticalSpace(size.height / 18),
                      const Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26.0),
                        child: Center(
                            child: Text(
                                "There are a lot of coffee type in this industry. Do you want to taste them?",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: COLOR_BLACK))),
                      ),
                      
                    ],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed:(){
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  Navigator.push(context,MaterialPageRoute(builder:(BuildContext)=> const FavoritePage()));
                },
                backgroundColor:Colors.red,
                child:const Icon(Icons.favorite)
              ),
      ),
    );
  }
}
