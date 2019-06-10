import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add('Laptop');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
            appBar: AppBar(title: Text('Long List App')),
            body: Products(_products),
            bottomNavigationBar: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _products.add('Laptop');
                });
              },
            )));
  }
}
