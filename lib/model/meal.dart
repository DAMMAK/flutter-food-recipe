import 'package:flutter/material.dart';

class Meal {
  String Id;
  String meal;
  String Category;
  String Area;
  String Instruction;
  String ThumbImg;
  String Tags;
  String Video;
  List<String> Ingredients;
  List<String> Measurements;

  Meal(
      {this.Id,
      this.meal,
      this.Category,
      this.Area,
      this.Ingredients,
      this.Instruction,
      this.Measurements,
      this.Tags,
      this.ThumbImg,
      this.Video});

  factory Meal.fromJson(Map<String, dynamic> parsedJson) {
    List<String> ingredients = List<String>();
    List<String> measurement = List<String>();
    for (int i = 1; i <= 20; i++) {
      if (parsedJson['strIngredient${i}'] != '')
        ingredients.add(parsedJson['strIngredient${i}']);
      if (parsedJson['strMeasure${i}'] != '')
        measurement.add(parsedJson['strMeasure${i}']);
    }

    return Meal(
        meal: parsedJson['strMeal'],
        Area: parsedJson['American'],
        ThumbImg: parsedJson['strMealThumb'],
        Category: parsedJson['strCategory'],
        Id: parsedJson['idMeal'],
        Ingredients: ingredients,
        Instruction: parsedJson['strInstructions'],
        Measurements: measurement,
        Video: parsedJson['strYoutube'],
        Tags: parsedJson['strTags']);
  }
}
