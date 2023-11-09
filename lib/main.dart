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

  final tipTextField = TextEditingController();
  double _bill = 0.00;
  double _tipPercent = 0.15;
  double _tip = 0.00;
  bool _excellentService = false;

  void _calculateTip() {
    _bill = double.parse(tipTextField.text);
    _tipPercent = (_excellentService) ? 0.2 : 0.15;
    _tip = _bill * _tipPercent;
    setState(() {
      _bill += _tip;
    });
    // tipTextField.text =
  }

  void _updateTipResult() {

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
            TextField(controller: tipTextField),
            ElevatedButton(
              child: Text("Calculate total bill"),
              onPressed: () {
                _calculateTip();
              },
            ),
            Text("\nGreat service?:"),
            Switch(
              value: _excellentService,
              onChanged: (value) {
                setState(() {
                  _excellentService = value;
                });
              },
            ),
            Text("\nTotal bill: " + _bill.toString()),
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
