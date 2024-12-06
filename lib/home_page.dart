import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/yoga.png'),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/workouts');
            },
            icon: const Icon(Icons.fitness_center),
            label: const Text('Go to Workouts'),
          ),
        ],
      ),
    );
  }
}
