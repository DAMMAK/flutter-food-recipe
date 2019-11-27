import 'package:flutter/material.dart';
import 'package:foodrecipes/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favourite{


   Future<SharedPreferences> get instance async => await SharedPreferences.getInstance();

  Future<bool> addFavourite(String key, String val)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_pref.getString(key)==null) {
      await _pref.setString(key, val);
      return true;
    }
    return false;
   }

   Future<String> getFavourite(String key)async{
     SharedPreferences _pref = await SharedPreferences.getInstance();
     String val = _pref.getString(key);
     if(val == null) return "NO";
     return val;
   }


   Future<List<Meal>> getAllFavourite(List<Meal> meals)async{
     SharedPreferences _pref = await SharedPreferences.getInstance();
     meals.map((meal)async{
       meal.isFavourite = await _pref.getString(meal.meal) !=null ? true : false;
       print(meal);
       return meal;
     });
     return meals;
   }


}