import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourName_MidtermExam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MidtermExam(),
    );
  }
}

class MidtermExam extends StatefulWidget {
  @override
  _MidtermExamState createState() => _MidtermExamState();
}

class _MidtermExamState extends State<MidtermExam> {
  final List<String> items = [
    'Dumbbell',
    'Barbell',
    'Bar',
    'Bench',
    'Wrist Strap',
    'Lifting Strap',
    'Creatine',
    'Whey Protein',
    'Pre Workout',
    'Belt',
  ];

  final List<bool> addedStatus = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harvey_MidterExam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: addedStatus[index] ? Colors.green[200] : Colors.white,
                    child: ListTile(
                      title: Text(items[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              print('Details of ${items[index]} is <3');
                            },
                            child: Text('Details'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                addedStatus[index] = true;
                              });
                            },
                            child: Text(
                              addedStatus[index] ? 'Added' : 'Add',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
