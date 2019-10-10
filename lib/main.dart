import 'package:flutter/material.dart';
import './exercise.dart';

void main() => runApp(GymApp());

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Program for the day',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: GymProgram(),
    );
  }
}