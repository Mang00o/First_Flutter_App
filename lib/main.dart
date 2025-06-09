import 'package:flutter/material.dart';

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
                // TODO: apri funzionalità allenamento
              },
            ),
          ],
        ),
      ),
    );
  }
}
