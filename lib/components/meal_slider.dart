import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodrecipes/components/favourite.dart';
import 'package:foodrecipes/components/recipe_card.dart';
import 'package:foodrecipes/pages/meal_detail.dart';
import 'package:foodrecipes/theme.dart';

import '../model/meal.dart';

var mealColors = [
  0xFF2422B7,
  0xFF065535,
  0xFF800080,
  0xFFff6666,
  0xFFff4040,
  0xFF794044,
  0xFFdaa520,
  0xFFff00ff,
  0xFFfabebe,
  0xFF469990
];

class MealSlider extends StatefulWidget {
   List<Meal> meals;
  MealSlider({Key key, @required this.meals}) : super(key: key);

  @override
  _MealSliderState createState() => _MealSliderState();
}

class _MealSliderState extends State<MealSlider> {


  @override
  Widget build(BuildContext context) {
    final List<Meal> meals = widget.meals;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = 0.64 * screenHeight;
    final cardWidth = screenWidth;

    return Container(
        height: cardHeight,
        width: cardWidth,
        child: Swiper(
            itemCount: meals.length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  RecipeCard(
                    color: Color(mealColors[index]),
                    meal: meals[index],
                  ),
                  CookingButton(
                    color: Color(mealColors[index]),
                    onTap: () {
                      print(
                          'Start Cooking Button Pressed at meal ${meals[index].meal}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealDetail(
                                    meal: meals[index],
                                  )));
                    },
                  )
                ],
              );
            }));
  }

  @override
  void initState() {
//    FutureBuilder(
//      future: Favourite().getAllFavourite(widget.meals),
//      builder: (BuildContext context, AsyncSnapshot snapshot){
//        if(snapshot.data !=null){
//          widget.meals = snapshot.data;
//        }
//      }
//    );

  }
}
