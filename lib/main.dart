import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userInputMeters = '';
  String _userInputFeet = '';
  double _feet = 0.0;
  double _meters = 0.0;
  final _logger = Logger();

  void _updateUserInputMeters(String input) {
    setState(() {
      _userInputMeters = input;
    });
  }

  void _updateUserInputFeet(String input) {
    setState(() {
      _userInputFeet = input;
    });
  }

  void _convertToFeet() {
    double meters = double.tryParse(_userInputMeters) ?? 0.0;
    setState(() {
      _feet = meters * 3.28084;
    });
    _logger.i('$meters meters is $_feet feet.');
  }

  void _convertToMeters() {
    double feet = double.tryParse(_userInputFeet) ?? 0.0;
    setState(() {
      _meters = feet / 3.28084;
    });
    _logger.i('$feet feet is $_meters meters.');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter a value in meters:',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 24.0),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter a value',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateUserInputMeters(value),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _convertToFeet,
                child: const Text('Convert to feet'),
              ),
              const SizedBox(height: 24.0),
              Text('$_feet feet'),
              const Text(
                'Enter a value in feet:',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 24.0),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter a value',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateUserInputFeet(value),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _convertToMeters,
                child: const Text('Convert to meters'),
              ),
              const SizedBox(height: 24.0),
              Text('$_meters meters'),
            ],
          ),
        ),
      ),
    );
  }
}
