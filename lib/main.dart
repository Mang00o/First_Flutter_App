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

class Meal {
  String name;
  int timesToEat;
  int timesEaten;

  Meal({
    required this.name,
    required this.timesToEat,
    this.timesEaten = 0,
  });

  // Verifica se è stato mangiato abbastanza volte
  bool get isComplete => timesEaten >= timesToEat;
}

class ProteinSourcesScreenState extends State<ProteinSourcesScreen> {
  // Lista degli alimenti e numero di volte
  List<Meal> meals = [
    Meal(name: 'Cefalopodi', timesToEat: 1),
    Meal(name: 'Pesce', timesToEat: 2),
    Meal(name: 'Tonno conservato', timesToEat: 2),
    Meal(name: 'Carne o affettati', timesToEat: 4),
    Meal(name: 'Uova', timesToEat: 1),
    Meal(name: 'Latticini', timesToEat: 2),
    Meal(name: 'Legumi', timesToEat: 2),
  ];

  void toggleMeal(int index) {
    setState(() {
      if (meals[index].timesEaten < meals[index].timesToEat) {
        meals[index].timesEaten++;
      } else {
        meals[index].timesEaten--;
      }
    });
  }

  void resetSelections() {
    setState(() {
      for (var meal in meals) {
        meal.timesEaten = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dieta Settimanale'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                double progress = meals[index].timesEaten / meals[index].timesToEat;

                return ListTile(
                  title: Text(meals[index].name),
                  subtitle: Text(
                    'Mangiare ${meals[index].timesToEat} volte, mangiate ${meals[index].timesEaten} volte',
                  ),
                  trailing: Column(
                    children: [
                      // Barra di progressione
                      SizedBox(
                        width: 50,
                        height: 20,
                        child: LinearProgressIndicator(
                          value: progress,
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => toggleMeal(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Bottone per resettare le selezioni
          Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: OutlinedButton(
              onPressed: resetSelections, // Quando premuto, resetta
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.5, // Imposta lo spessore del bordo
                  color: Colors.black, // Imposta il colore del bordo
                ),
              ),
              child: Text('Resetta Selezioni'),
            ),
          ),
        ],
      ),
    );
  }
}