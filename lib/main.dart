import 'package:flutter/material.dart';
import 'pages/workout_page.dart';
import 'pages/tracker_page.dart';
import 'pages/statistic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Allenamento',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Pagina principale')),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // TODO: azione impostazioni
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // TODO: azione profilo
              },
            ),
            IconButton(
              icon: const Icon(Icons.fitness_center),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder:
                      (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.list),
                              title: const Text('Workout'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const WorkoutPage(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Tracker'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const TrackerPage(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.bar_chart),
                              title: const Text('Statistic'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const StatisticPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
