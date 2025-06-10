import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> inviaWorkout() async {
  final uri = Uri.parse('http://10.0.2.2:3000/api/workouts');
  final response = await http.post(
    uri,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'title': 'Workout test',
      'description': 'Push-up + squat',
    }),
  );
  if (response.statusCode == 201) {
    print('Workout salvato: ${response.body}');
  } else {
    print('Errore: ${response.statusCode}');
  }
}

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Qui puoi consultare la tua scheda di allenamento.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                inviaWorkout();
              },
              child: const Text('Salva workout'),
            ),
          ],
        ),
      ),
    );
  }
}

