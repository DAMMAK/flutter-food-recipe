import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodrecipes/components/favourite.dart';
import 'package:foodrecipes/components/recipe_card.dart';
import 'package:foodrecipes/components/meal_slider.dart';
import '../model/meal.dart';
import '../theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Meal> meals;


//  @override
//  void initState() {
//    super.initState();
////    getMeals();
//
//  }
//
//  Future getMeals() async {
//    meals = await getMealUrl();
//    print('Meals data ${meals}');
//  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bolt), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart), title: Text(''))
      ]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.bolt,
                size: 20.0,
                color: Colors.orangeAccent,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CircleRounded'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'new',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: blue),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'recipes',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                 //   Favourite().getAllFavourite(snapshot.data);
                    return MealSlider(meals: snapshot.data);
                  } else {
                    return Transform.translate(
                      offset: Offset(0.0, height * 0.25),
                      child: SpinKitFadingFour(
                        size: 100.0,
                        color: Colors.blue,
                      ),
                    );
                  }
                },
                future: getMealUrl(),
              ),
//              CookingButton(
//                color: btnColor,
//              )
            ],
      ),
    ),
    ),
    );
  }
}
