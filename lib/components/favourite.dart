import 'package:flutter/material.dart';
import 'package:foodrecipes/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favourite{


   Future<SharedPreferences> get instance async => await SharedPreferences.getInstance();

  Future<bool> addFavourite(String key, String val)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_pref.getString(key)==null) {
      bool fav = await _pref.setString(key, val);
      print("Favourite Add => ${fav}");
      return fav;
    }
    return false;
   }

   Future<bool> getFavourite(String key)async{
     SharedPreferences _pref = await SharedPreferences.getInstance();
     String val = _pref.getString(key);
     print("Meal Detail => ${val}");
     if(val == null) return false;
     return true;
   }


   Future<List<Meal>> getAllFavourite(List<Meal> meals)async{
     SharedPreferences _pref = await SharedPreferences.getInstance();
     meals.map((meal){
       meal.isFavourite = _pref.getString(meal.meal) !=null ? true : false;
       // meal.isFavourite = await _pref.getString(meal.meal) !=null ? true : false;
       return meal;
     });
     print(meals);

     return meals;
   }


}