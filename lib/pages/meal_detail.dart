import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodrecipes/components/video_card.dart';
import 'package:foodrecipes/model/meal.dart';

import '../theme.dart';

class MealDetail extends StatelessWidget {
  Meal meal;

  MealDetail({this.meal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: blue,
                      size: 30.0,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Sweet',
                    style:
                        TextStyle(fontSize: 40.0, fontFamily: 'CircleRounded'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Vanilla',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.orangeAccent,
                        fontFamily: 'CircleRounded',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                'Exclair',
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'CircleRounded',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              VideoCard(color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: green.withOpacity(0.5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Text(
                        meal.Category,
                        style: TextStyle(
                          color: shadedWhite,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.clock,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          '240 minutes',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                  itemCount: meal.Ingredients.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Text("-"),
                        title: Text(meal.Measurements[index]),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
