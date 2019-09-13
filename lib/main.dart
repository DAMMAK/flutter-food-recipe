import 'package:flutter/material.dart';
import 'package:foodrecipes/pages/home.dart';
import 'package:foodrecipes/pages/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MealDetail(),
    );
  }
}
