import 'package:flutter/material.dart';
import 'package:foodrecipes/pages/home.dart';
import 'package:foodrecipes/pages/meal_detail.dart';
import 'package:provider/provider.dart';

import 'model/meal.dart';

//void main() => runApp(MyApp());

void main() => runApp(ChangeNotifierProvider<Meal>(builder: (BuildContext context)=> Meal(),
    child: MyApp()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
