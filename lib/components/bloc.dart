

import 'dart:async';

import 'package:foodrecipes/components/recipe_card.dart';
import 'package:foodrecipes/model/meal.dart';

class BLOC{

  StreamController streamController = StreamController();
  Stream stream;

  BLOC(){
    stream = streamController.stream;
  }

  addMeal(){
    stream = Stream.fromFuture(getMealUrl());
   // streamController.sink.add(_stream);
  }

}