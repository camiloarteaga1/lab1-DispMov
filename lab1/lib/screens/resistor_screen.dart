import 'package:flutter/material.dart';

class ResistorScreen extends StatefulWidget {
  const ResistorScreen({super.key});

  @override
  State<ResistorScreen> createState() => _ResistorScreenState();
}

class _ResistorScreenState extends State<ResistorScreen> {
  // Define the resistor color codes for bands 1, 2, 3 (if 5-band), and multiplier
  final List<String> colorBands = [
    'Black',
    'Brown',
    'Red',
    'Orange',
    'Yellow',
    'Green',
    'Blue',
    'Violet',
    'Gray',
    'White'
  ];
  final List<String> multiplierBands = [
    'Black',
    'Brown',
    'Red',
    'Orange',
    'Yellow',
    'Green',
    'Blue',
    'Violet',
    'Gray',
    'Gold',
    'Silver'
  ];

  final List<String> toleranceBands = [
    'Brown',
    'Red',
    'Green',
    'Blue',
    'Violet',
    'Gray',
    'Gold',
    'Silver'
  ];

  // Selected color values
  String? band1Color = 'Black';
  String? band2Color = 'Black';
  String? band3Color = 'Black';
  String? multiplierColor = 'Black';
  String? toleranceColor = 'Gold';

  int numberOfBands = 4;
  double resistanceValue = 0.0;
  String toleranceValue = '';

  // Color code map for significant digits
  Map<String, int> colorCodeMap = {
    'Black': 0,
    'Brown': 1,
    'Red': 2,
    'Orange': 3,
    'Yellow': 4,
    'Green': 5,
    'Blue': 6,
    'Violet': 7,
    'Gray': 8,
    'White': 9,
  };

  // Multiplier map
  Map<String, double> multiplierMap = {
    'Black': 1,
    'Brown': 10,
    'Red': 100,
    'Orange': 1000,
    'Yellow': 10000,
    'Green': 100000,
    'Blue': 1000000,
    'Violet': 10000000,
    'Gray': 100000000,
    'Gold': 0.1,
    'Silver': 0.01,
  };

  // Tolerance map
  Map<String, String> toleranceMap = {
    'Brown': '±1%',
    'Red': '±2%',
    'Green': '±0.5%',
    'Blue': '±0.25%',
    'Violet': '±0.1%',
    'Gray': '±0.05%',
    'Gold': '±5%',
    'Silver': '±10%',
  };

  void calculateResistance() {
    int band1Value = colorCodeMap[band1Color] ?? 0;
    int band2Value = colorCodeMap[band2Color] ?? 0;
    int band3Value = colorCodeMap[band3Color] ?? 0;
    double multiplierValue = multiplierMap[multiplierColor] ?? 1.0;

    if (numberOfBands == 3) {
      resistanceValue = ((band1Value * 10) + band2Value) * multiplierValue;
    } else if (numberOfBands == 4) {
      resistanceValue = ((band1Value * 10) + band2Value) * multiplierValue;
      toleranceValue = toleranceMap[toleranceColor] ?? '';
    } else if (numberOfBands == 5) {
      resistanceValue =
          ((band1Value * 100) + (band2Value * 10) + band3Value) * multiplierValue;
      toleranceValue = toleranceMap[toleranceColor] ?? '';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            top: 9.0, 
            bottom: 9.0,
          ),
          // child: Image(
          //   image: AssetImage('assets/icons/logo.png'),
          // ),
        ),
        backgroundColor: const Color.fromARGB(170, 29, 112, 108),
        title: const Text('My Movies'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              value: numberOfBands,
              items: [3, 4, 5].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value Bands'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  numberOfBands = newValue ?? 4;
                });
              },
              decoration: const InputDecoration(labelText: 'Number of Bands'),
            ),
            DropdownButtonFormField<String>(
              value: band1Color,
              items: colorBands.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  band1Color = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Band 1 Color'),
            ),
            DropdownButtonFormField<String>(
              value: band2Color,
              items: colorBands.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  band2Color = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Band 2 Color'),
            ),
            if (numberOfBands == 5)
              DropdownButtonFormField<String>(
                value: band3Color,
                items: colorBands.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    band3Color = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Band 3 Color'),
              ),
            DropdownButtonFormField<String>(
              value: multiplierColor,
              items: multiplierBands.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  multiplierColor = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Multiplier Color'),
            ),
            if (numberOfBands == 4 || numberOfBands == 5)
              DropdownButtonFormField<String>(
                value: toleranceColor,
                items: toleranceBands.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    toleranceColor = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Tolerance Color'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResistance,
              child: const Text('Calculate Resistance'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resistance: ${resistanceValue.toStringAsFixed(2)} Ω',
              style: const TextStyle(fontSize: 24),
            ),
            if (toleranceValue.isNotEmpty)
              Text(
                'Tolerance: $toleranceValue',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
