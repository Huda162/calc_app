import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Simple Calculator'),
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
  String _operation = "" ;


  double evaluateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  void _updateOperation(String n) {
    if (n == "=") {
        double result = evaluateExpression(_operation);
        setState(() {
          _operation = result.toString();
        });
      }
     else {
      setState(() {
        _operation += n;
      });
    }

  }

  void _clearOperation(){
    setState(() {
      _operation = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'you want to calculat: ',
            ),
            Text(
               '$_operation',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
          Row(
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {_updateOperation("7");},
                    child: Text("7"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("4");},
                    child: Text("4"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("1");},
                    child: Text("1"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("0");},
                    child: Text("0"),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {_updateOperation("8");},
                    child: Text("8"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("5");},
                    child: Text("5"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("2");},
                    child: Text("2"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _clearOperation,
                    child: Text("AC"),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {_updateOperation("9");},
                    child: Text("9"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("6");},
                    child: Text("6"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("3");},
                    child: Text("3"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("=");},
                    child: Text("="),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {_updateOperation("*");},
                    child: Text("*"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("/");},
                    child: Text("/"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("-");},
                    child: Text("-"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {_updateOperation("+");},
                    child: Text("+"),
                  ),
                ],
              ),
            ],
          )
      ]
      ),
    );
  }
}
