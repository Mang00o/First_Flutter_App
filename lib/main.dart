import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diario Alimentare',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProteinSourcesScreen(),
    );
  }
}

class ProteinSourcesScreen extends StatefulWidget {
  const ProteinSourcesScreen({super.key});

  @override
  ProteinSourcesScreenState createState() => ProteinSourcesScreenState();
}

class ProteinSourcesScreenState extends State<ProteinSourcesScreen> {
  // Lista di fonti proteiche
  final List<String> proteinSources = [
    'Pollo',
    'Manzo',
    'Pesce',
    'Tofu',
    'Uova',
    'Legumi',
  ];

  // Stato di ciascuna checkbox
  Map<String, bool> selectedSources = {};

  @override
  void initState() {
    super.initState();
    // Impostiamo tutte le checkbox come non selezionate
    for (var source in proteinSources) {
      selectedSources[source] = false;
    }
  }

  // Funzione per resettare i checkbox
  void resetSelections() {
    setState(() {
      for (var source in proteinSources) {
        selectedSources[source] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fonti Proteiche')),
      body: Column(
        children: [
          // Lista dei checkbox
          Expanded(
            child: ListView(
              children:
                  proteinSources.map((source) {
                    return CheckboxListTile(
                      title: Text(source),
                      value: selectedSources[source],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedSources[source] = value!;
                        });
                      },
                    );
                  }).toList(),
            ),
          ),
          // Bottone per resettare i checkbox
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: resetSelections, // Quando premuto, resetta
              child: Text('Resetta Selezioni'),
            ),
          ),
        ],
      ),
    );
  }
}
