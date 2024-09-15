import 'package:flutter/material.dart';

class ResistorScreen extends StatefulWidget {
  const ResistorScreen({super.key});

  @override
  State<ResistorScreen> createState() => _ResistorScreenState();
}

class _ResistorScreenState extends State<ResistorScreen> {
  // Define the resistor color codes for bands 1, 2, 3, multiplier, tolerance, and temperature coefficient
  final List<String> colorBands = [
    'Negro',
    'Café',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Verde',
    'Azúl',
    'Violeta',
    'Gris',
    'Blanco'
  ];

  final List<String> multiplierBands = [
    'Negro',
    'Café',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Verde',
    'Azúl',
    'Violeta',
    'Gris',
    'Oro',
    'Plata'
  ];

  final List<String> toleranceBands = [
    'Café',
    'Rojo',
    'Verde',
    'Azúl',
    'Violeta',
    'Gris',
    'Oro',
    'Plata'
  ];

  final List<String> tempCoefficientBands = [
    'Café',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Azúl',
    'Violeta'
  ];

  // Selected color values
  String? band1Color = 'Negro';
  String? band2Color = 'Negro';
  String? band3Color = 'Negro';
  String? multiplierColor = 'Negro';
  String? toleranceColor = 'Oro';
  String? tempCoefficientColor = 'Café';

  int numberOfBands = 4;
  double resistanceValue = 0.0;
  String toleranceValue = '';
  String tempCoefficientValue = '';

  // Color code map for significant digits
  Map<String, int> colorCodeMap = {
    'Negro': 0,
    'Café': 1,
    'Rojo': 2,
    'Naranja': 3,
    'Amarillo': 4,
    'Verde': 5,
    'Azúl': 6,
    'Violeta': 7,
    'Gris': 8,
    'Blanco': 9,
  };

  // Multiplier map
  Map<String, double> multiplierMap = {
    'Negro': 1,
    'Café': 10,
    'Rojo': 100,
    'Naranja': 1000,
    'Amarillo': 10000,
    'Verde': 100000,
    'Azúl': 1000000,
    'Violeta': 10000000,
    'Gris': 100000000,
    'Oro': 0.1,
    'Plata': 0.01,
  };

  // Tolerance map
  Map<String, String> toleranceMap = {
    'Café': '±1%',
    'Rojo': '±2%',
    'Verde': '±0.5%',
    'Azúl': '±0.25%',
    'Violeta': '±0.1%',
    'Gris': '±0.05%',
    'Oro': '±5%',
    'Plata': '±10%',
  };

  // Temperature coefficient map (ppm/°C)
  Map<String, String> tempCoefficientMap = {
    'Café': '100 ppm/°C',
    'Rojo': '50 ppm/°C',
    'Naranja': '15 ppm/°C',
    'Amarillo': '25 ppm/°C',
    'Azúl': '10 ppm/°C',
    'Violeta': '5 ppm/°C',
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
        backgroundColor: const Color.fromARGB(255, 237, 106, 46), // Color de la Barra
        title: const Text(
          'Calculadora de resistencias',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
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
                  child: Text('$value Bandas'),
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
