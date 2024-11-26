import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UnitConverter(),
    );
  }
}

class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  String selectedFromUnit = 'Meters';
  String selectedToUnit = 'Kilometers';
  String inputValue = '';
  String result = '';

  void convert() {
    double input = double.tryParse(inputValue) ?? 0.0;
    double convertedValue = 0.0;

    if (selectedFromUnit == 'Meters' && selectedToUnit == 'Kilometers') {
      convertedValue = input * 0.001;
    } else if (selectedFromUnit == 'Kilometers' && selectedToUnit == 'Meters') {
      convertedValue = input * 1000;
    }

    setState(() {
      result = convertedValue.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Unit Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Convert Units',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedFromUnit,
              onChanged: (value) {
                setState(() {
                  selectedFromUnit = value!;
                });
              },
              items: ['Meters', 'Kilometers'].map((unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedToUnit,
              onChanged: (value) {
                setState(() {
                  selectedToUnit = value!;
                });
              },
              items: ['Meters', 'Kilometers'].map((unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputValue = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
