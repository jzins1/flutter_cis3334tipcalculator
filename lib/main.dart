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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Initialize our widgets and variables
  final tipTextField = TextEditingController();
  double _bill = 0.00;
  double _tipPercent = 0.15;
  double _tip = 0.00;
  bool _excellentService = false;

  // Executes when the calculate tip button is pressed
  void _calculateTip() {
    _bill = double.parse(tipTextField.text); // Convert text field for this double variable
    _tipPercent = (_excellentService) ? 0.2 : 0.15; // Uses ternary operator to set the tip percent variable
    _tip = _bill * _tipPercent; // Adds the tip to the bill

    // Updates the text field showing the bill amount
    setState(() {
      _bill += _tip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("CIS 3334 Tip Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Total Bill:'),
            TextField(controller: tipTextField), // Links input box for later value reference
            // Button for calculating total bill
            ElevatedButton(
              child: Text("Calculate total bill"),
              onPressed: () {
                _calculateTip(); // Execute the tip calculate method
              }
            ),

            // Great service switch and label
            Text("\nGreat service?:"),
            Switch(
              value: _excellentService,
              onChanged: (value) {
                setState(() {
                  _excellentService = value;
                });
              },
            ),

            Text("\nTotal bill: " + _bill.toString()), // Display the total calculated bill (links variable from setState called above
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
