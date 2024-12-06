import 'package:flutter/material.dart';

class Workout {
  final String name;
  final String details;
  final IconData icon;

  Workout(this.name, this.details, this.icon);

  static Future<List<Workout>> fetchWorkouts() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      Workout('Yoga', 'A relaxing routine', Icons.self_improvement),
      Workout('Cardio', 'Boost your stamina', Icons.directions_run),
      Workout('Strength', 'Build muscle mass', Icons.fitness_center),
    ];
  }
}
