import 'package:flutter/material.dart';

const textFieldStyler = InputDecoration(
  border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10))),
  fillColor: Colors.white,
  filled: true,
  hintText: "Enter city's name",
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(
    Icons.location_city,
    color: Color(0XFF2D2D2D),
    size: 40.0,
  ),
);

const openWeatherMapKey = "629569080eb27800c0da0ed775d82840";
