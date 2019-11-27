import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  bool isFavourite;

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
    for (int i = 0; i <= 19; i++) {
      if (parsedJson['Ingredients'][i] != '')
        ingredients.add(parsedJson['Ingredients'][i]);
      if (parsedJson['Measurements'][i] != '')
        measurement.add(parsedJson['Measurements'][i]);
    }

    return Meal(
        meal: parsedJson['Name'],
       // Area: parsedJson['American'],
        ThumbImg: parsedJson['ThumbImg'],
        Category: parsedJson['Category'],
        Id: parsedJson['_id'],
        Ingredients: ingredients,
        Instruction: parsedJson['Instruction'],
        Measurements: measurement,
        Video: YoutubePlayer.convertUrlToId(parsedJson['Video'].toString()),
      //  Tags: parsedJson['Tags']
        );
  }
}
