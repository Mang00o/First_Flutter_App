import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Map<String, dynamic>> loadWorkout() async {
    final jsonString = await rootBundle.loadString('assets/workouts.json');
    final data = json.decode(jsonString);
    final month = data['month'];
    final week = data['weeks'][0]['week'];
    final day = data['weeks'][0]['days'][0]['day'];
    final exercises = data['weeks'][0]['days'][0]['exercises'] as List<dynamic>;
    return {
      'title': 'M$month-W$week-D$day',
      'exercises': exercises.map((e) => e as Map<String, dynamic>).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: loadWorkout(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Errore: ${snapshot.error}'));
            } else {
              final title = snapshot.data!['title'];
              final exercises = snapshot.data!['exercises'] as List<Map<String, dynamic>>;
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
              );
            }
          },
        ),
      ),
    );
  }
}
