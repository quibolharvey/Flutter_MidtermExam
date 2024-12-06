import 'dart:convert';
import 'package:http/http.dart' as http;
import 'workout_data.dart';

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  // Fetch Workouts
  static Future<List<Workout>> fetchWorkouts() async {
    final response = await http.get(Uri.parse('$baseUrl/workouts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Workout.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  // Add Workout
  static Future<Workout> addWorkout(Workout workout) async {
    final response = await http.post(
      Uri.parse('$baseUrl/workouts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(workout.toJson()),
    );
    if (response.statusCode == 201) {
      return Workout.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add workout');
    }
  }

  // Edit Workout
  static Future<Workout> editWorkout(int id, Workout workout) async {
    final response = await http.put(
      Uri.parse('$baseUrl/workouts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(workout.toJson()),
    );
    if (response.statusCode == 200) {
      return Workout.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to edit workout');
    }
  }

  // Delete Workout
  static Future<void> deleteWorkout(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/workouts/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete workout');
    }
  }
}
