import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../theme.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

class RecipeCard extends StatelessWidget {
  Color color;
  Meal meal;

  RecipeCard({this.color, this.meal});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = 0.5 * screenHeight;
    final cardWidth = 0.80 * screenWidth;
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(meal.ThumbImg), fit: BoxFit.fill),
              color: blue.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    color.withOpacity(0.65),
                    color.withOpacity(0.65),
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
        ),
        Container(
          height: cardHeight,
          width: cardWidth,
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, bottom: 40.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: green.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Text(
                      meal.Category,
                      style: TextStyle(
                        color: shadedWhite,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Favourite');
                    },
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: shadedWhite,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    meal.meal,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: shadedWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.clock,
                          color: shadedWhite,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          '240 minutes',
                          style: TextStyle(
                              color: shadedWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CookingButton extends StatelessWidget {
  Color color;
  final Function onTap;

  CookingButton({this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final borderRadius = Radius.circular(60.0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 7.0),
        height: 60.0,
        width: 0.8 * screenWidth,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: borderRadius,
                bottomRight: borderRadius,
                bottomLeft: borderRadius)),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Start Cooking',
            style: TextStyle(
                color: shadedWhite,
                fontFamily: 'CircleRounded',
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

List<Meal> mealData() {
  final List<Meal> meals = List<Meal>();
  final meal1 = Meal(
      meal: 'Kafteji',
      ThumbImg:
          'https://www.themealdb.com/images/media/meals/1bsv1q1560459826.jpg',
      Area: 'Tunisian');

  final meal2 = Meal(
      meal: 'Fennel Dauphinoise',
      ThumbImg:
          'https://www.themealdb.com/images/media/meals/ytttsv1511798734.jpg',
      Area: 'French');

  final meal3 = Meal(
      meal: 'Grilled Mac and Cheese Sandwich',
      ThumbImg:
          'https://www.themealdb.com/images/media/meals/xutquv1505330523.jpg',
      Area: 'American');

  final meal4 = Meal(
      meal: 'Corba',
      ThumbImg:
          'https://www.themealdb.com/images/media/meals/58oia61564916529.jpg',
      Area: 'Turkish');

  meals.add(meal1);
  meals.add(meal2);
  meals.add(meal3);
  meals.add(meal4);
  getMealUrl();
  return meals;
}

Future<List<Meal>> getMealUrl() async {
  final mealUrl =
      await http.get('https://foodrecipeapp.herokuapp.com/recipe');
//  print('Meal Data ${mealUrl.body}');
  final mealDataString = jsonDecode(mealUrl.body);
  print('Meal Data => ${mealDataString}');

  List<Meal> meals = List<Meal>();
  for (int i = 0; i < mealDataString.length; i++) {
    final Meal meal = Meal.fromJson(mealDataString[i]);
    print(meal);
    meals.add(meal);
  }
  return meals;
}
