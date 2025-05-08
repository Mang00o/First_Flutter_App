import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<List<Map<String, dynamic>>> loadWorkout() async {
    final jsonString = await rootBundle.loadString('assets/workouts.json');
    final data = json.decode(jsonString);
    final firstDay = data['weeks'][0]['days'][0]['exercises'] as List<dynamic>;
    return firstDay.map((e) => e as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Primo Allenamento')),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: loadWorkout(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Errore: ${snapshot.error}'));
            } else {
              final exercises = snapshot.data!;
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final ex = exercises[index];
                  return ListTile(
                    title: Text(ex['name']),
                    subtitle: Text(
                      '${ex['sets']}x${ex['reps']} @ ${ex['weight']}kg - ${ex['variation']}',
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
