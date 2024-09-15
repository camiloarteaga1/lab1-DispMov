import 'package:flutter/material.dart';

class ResistorScreen extends StatefulWidget {
  const ResistorScreen({super.key});

  @override
  State<ResistorScreen> createState() => _ResistorScreenState();
}

class _ResistorScreenState extends State<ResistorScreen> {
  // Define the resistor color codes for bands 1, 2, 3, multiplier, tolerance, and temperature coefficient
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

  final List<String> tempCoefficientBands = [
    'Brown',
    'Red',
    'Orange',
    'Yellow',
    'Blue',
    'Violet'
  ];

  // Selected color values
  String? band1Color = 'Black';
  String? band2Color = 'Black';
  String? band3Color = 'Black';
  String? multiplierColor = 'Black';
  String? toleranceColor = 'Gold';
  String? tempCoefficientColor = 'Brown';

  int numberOfBands = 4;
  double resistanceValue = 0.0;
  String toleranceValue = '';
  String tempCoefficientValue = '';

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

  // Temperature coefficient map (ppm/°C)
  Map<String, String> tempCoefficientMap = {
    'Brown': '100 ppm/°C',
    'Red': '50 ppm/°C',
    'Orange': '15 ppm/°C',
    'Yellow': '25 ppm/°C',
    'Blue': '10 ppm/°C',
    'Violet': '5 ppm/°C',
  };

  void calculateResistance() {
    int band1Value = colorCodeMap[band1Color] ?? 0;
    int band2Value = colorCodeMap[band2Color] ?? 0;
    int band3Value = colorCodeMap[band3Color] ?? 0;
    double multiplierValue = multiplierMap[multiplierColor] ?? 1.0;

    if (numberOfBands == 4) {
      resistanceValue = ((band1Value * 10) + band2Value) * multiplierValue;
      toleranceValue = toleranceMap[toleranceColor] ?? '';
    } else if (numberOfBands == 5) {
      resistanceValue =
          ((band1Value * 100) + (band2Value * 10) + band3Value) * multiplierValue;
      toleranceValue = toleranceMap[toleranceColor] ?? '';
    } else if (numberOfBands == 6) {
      resistanceValue =
          ((band1Value * 100) + (band2Value * 10) + band3Value) * multiplierValue;
      toleranceValue = toleranceMap[toleranceColor] ?? '';
      tempCoefficientValue = tempCoefficientMap[tempCoefficientColor] ?? '';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de resistencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Number of bands dropdown
            DropdownButtonFormField<int>(
              value: numberOfBands,
              items: [4, 5, 6].map((int value) {
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
              decoration: const InputDecoration(labelText: 'Número de bandas'),
            ),
            // Band 1 dropdown
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
              decoration: const InputDecoration(labelText: 'Color Banda 1'),
            ),
            // Band 2 dropdown
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
              decoration: const InputDecoration(labelText: 'Color Banda 2'),
            ),
            // Band 3 dropdown (only visible for 5- and 6-band resistors)
            if (numberOfBands >= 5)
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
                decoration: const InputDecoration(labelText: 'Color Banda 3'),
              ),
            // Multiplier dropdown
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
              decoration: const InputDecoration(labelText: 'Color del Multiplicador'),
            ),
            // Tolerance dropdown (only visible for 4, 5, and 6 bands)
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
              decoration: const InputDecoration(labelText: 'Color de la Tolerancia'),
            ),
            // Temperature coefficient dropdown (only visible for 6-band resistors)
            if (numberOfBands == 6)
              DropdownButtonFormField<String>(
                value: tempCoefficientColor,
                items: tempCoefficientBands.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    tempCoefficientColor = newValue;
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'Coeficiente de Temperatura'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResistance,
              child: const Text('Calcular la resistencia'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resistividad: ${resistanceValue.toStringAsFixed(2)} Ω',
              style: const TextStyle(fontSize: 24),
            ),
            if (toleranceValue.isNotEmpty)
              Text(
                'Tolerancia: $toleranceValue',
                style: const TextStyle(fontSize: 18),
              ),
            if (tempCoefficientValue.isNotEmpty)
              Text(
                'Coeficiente Temp: $tempCoefficientValue',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
