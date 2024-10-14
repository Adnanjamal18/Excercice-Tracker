import 'package:crud_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
final coloescheme = Color.fromARGB(545, 44, 443, 23);
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: coloescheme)),
    home: HomeScreen(),));
}

 