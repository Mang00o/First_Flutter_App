import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WorkoutScreen(),
    );
  }
}

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<dynamic> days = [];
  int currentDayIndex = 0;
  int month = 0;
  int week = 0;

  Future<void> loadWorkout() async {
    final jsonString = await rootBundle.loadString('assets/workouts.json');
    final data = json.decode(jsonString);
    setState(() {
      month = data['month'];
      week = data['weeks'][0]['week'];
      days = data['weeks'][0]['days'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadWorkout();
  }

  void nextDay() {
    setState(() {
      currentDayIndex = (currentDayIndex + 1) % days.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Caricamento...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentDay = days[currentDayIndex];
    final title = 'M$month-W$week-D${currentDay['day']}';
    final exercises = currentDay['exercises'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return ListTile(
            title: Text(ex['name']),
            subtitle: Text('${ex['sets']}x${ex['reps']} @ ${ex['weight']}kg - ${ex['variation']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextDay,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
