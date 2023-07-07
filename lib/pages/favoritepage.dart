import 'package:coffee_shop/utils/constants.dart';
import 'package:coffee_shop/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _initialized = false;
  List<String> favoriteList = [];

  void _initialize() {
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _initialized = true;
        });
      }
    });
  }

  Future<void> readyPrefs() async {
    if (favoriteList.isEmpty) {
      var prefs = await SharedPreferences.getInstance();
      prefs.getBool("creamycoffee") == true
          ? favoriteList.add("Creamy Coffee")
          : null;
      prefs.getBool("espresso") == true ? favoriteList.add("Espresso") : null;
      prefs.getBool("icedamericano") == true
          ? favoriteList.add("Iced Americano")
          : null;
      prefs.getBool("filtercoffee") == true
          ? favoriteList.add("Filter Coffee")
          : null;
    }
  }

  @override
  void initState() {
    super.initState();
    readyPrefs();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: COLOR_BG,
            body: _initialized
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Center(
                            child: Text("These are your favorite coffees",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                      ),
                      addVerticalSpace(size.height / 30),
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: 2,
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 2,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: COLOR_LISTTILE,
                              child: ListTile(
                                  leading: const Icon(Icons.coffee,color:COLOR_WHITE),
                                  trailing: Text(favoriteList[index],style:const TextStyle(color:COLOR_WHITE,fontSize:16))),
                            );
                          }),
                    ],
                  )
                : const Center(child: Text("Loading"))));
  }
}
