import 'package:flutter/material.dart';
import 'workout_data.dart';
import 'add_workout_page.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<Workout> workouts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    workouts = await Workout.fetchWorkouts();
    setState(() {});
  }

  void addWorkout(Workout newWorkout) {
    setState(() {
      workouts.add(newWorkout);
    });
  }

  void editWorkout(int index, Workout updatedWorkout) {
    setState(() {
      workouts[index] = updatedWorkout;
    });
  }

  void deleteWorkout(int index) {
    setState(() {
      workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: workouts.isEmpty
          ? const Center(child: Text('No workouts available. Add some!'))
          : ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                return Card(
                  child: ListTile(
                    leading: Icon(workout.icon, size: 30, color: Colors.teal),
                    title: Text(workout.name),
                    subtitle: Text(workout.details),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            final updatedWorkout = await Navigator.push<Workout>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddWorkoutPage(
                                  workout: workout,
                                ),
                              ),
                            );
                            if (updatedWorkout != null) {
                              editWorkout(index, updatedWorkout);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteWorkout(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newWorkout = await Navigator.push<Workout>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddWorkoutPage(),
            ),
          );
          if (newWorkout != null) {
            addWorkout(newWorkout);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
