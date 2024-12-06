import 'package:flutter/material.dart';
import 'workout_data.dart';

class AddWorkoutPage extends StatefulWidget {
  final Workout? workout;

  const AddWorkoutPage({Key? key, this.workout}) : super(key: key);

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _details;
  late IconData _selectedIcon;

  final List<Map<String, dynamic>> _iconOptions = [
    {'icon': Icons.self_improvement, 'label': 'Yoga'},
    {'icon': Icons.directions_run, 'label': 'Cardio'},
    {'icon': Icons.fitness_center, 'label': 'Strength'},
    {'icon': Icons.directions_bike, 'label': 'Cycling'},
    {'icon': Icons.pool, 'label': 'Swimming'},
    {'icon': Icons.sports_basketball, 'label': 'Basketball'},
    {'icon': Icons.sports_soccer, 'label': 'Soccer'},
    {'icon': Icons.hiking, 'label': 'Hiking'},
  ];

  @override
  void initState() {
    super.initState();
    _name = widget.workout?.name ?? '';
    _details = widget.workout?.details ?? '';
    _selectedIcon = widget.workout?.icon ?? Icons.self_improvement;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout == null ? 'Add Workout' : 'Edit Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Workout Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workout name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _details,
                decoration: const InputDecoration(labelText: 'Workout Details'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter workout details';
                  }
                  return null;
                },
                onSaved: (value) => _details = value!,
              ),
              DropdownButtonFormField<IconData>(
                decoration: const InputDecoration(labelText: 'Workout Icon'),
                value: _selectedIcon,
                items: _iconOptions
                    .map((option) => DropdownMenuItem<IconData>(
                          value: option['icon'],
                          child: Row(
                            children: [
                              Icon(option['icon'], size: 20, color: Colors.teal),
                              const SizedBox(width: 10),
                              Text(option['label']),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) => _selectedIcon = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newWorkout = Workout(_name, _details, _selectedIcon);
                    Navigator.pop(context, newWorkout);
                  }
                },
                child: const Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
