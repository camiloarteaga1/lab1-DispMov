import 'package:flutter/material.dart';

class CurrencyConv extends StatefulWidget {
  const CurrencyConv({super.key});

  @override
  State<CurrencyConv> createState() => _CurrencyConvState();
}

class _CurrencyConvState extends State<CurrencyConv> {
  final _valorConvertir = TextEditingController(); // Entrada del usuario

  double _valorConvertido = 0.0;

  // Monedas
  String _convertirDe = 'USD';
  String _convertirA = 'COP';

  // Tasas de cambio simples (estas tasas son aproximadas y no en tiempo real)
  final Map<String, double> _TasasCambio = {
    'USD': 1.0, // Tasa de referencia para USD
    'EUR': 0.91, // 1 USD = 0.91 EUR
    'COP': 4179.62, // 1 USD = 4179.62 COP
  };

  // Función para convertir entre monedas
  void _convertCurrency() {
    double valor = double.tryParse(_valorConvertir.text) ?? 0.0;
    double tasa1 = _TasasCambio[_convertirDe]!;
    double tasa2 = _TasasCambio[_convertirA]!;
    setState(() {
      _valorConvertido = (valor / tasa1) * tasa2;
    });
  }

  // Función para ajustar el número de decimales según sea necesario
  String _ajustarDecimales(double valor) {
    String valorStr =
        valor.toStringAsFixed(2); // Convertir inicialmente a 2 decimales
    int precision = 2;

    // Para valores de monedas pequeñas aumentamosla precisión hasta encontrar 2 cifras significativas
    while (valorStr == '0.00' && precision < 10) {
      precision++;
      valorStr = valor.toStringAsFixed(precision + 2);
    }
    return valorStr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(200, 236, 5, 156), //Color de la Barra
        title: const Text(
          'Conversor de monedas',
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
        padding: const EdgeInsets.all(16.0), // Espaciado para toda la página
        child: Center(
          child: SingleChildScrollView(
            // Para poder realizar scroll
            child: Column(
              // Columna
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centrando el contenido
              children: [
                Row(
                  // Fila para seleccionar la moneda a convertir y el valor
                  children: [
                    Expanded(
                      // Dropdown para seleccionar la moneda de origen
                      child: DropdownButton<String>(
                        value: _convertirDe,
                        items: _TasasCambio.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _convertirDe = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                        width:
                            16.0), // Espaciado entre el Dropdown y el TextField
                    Expanded(
                      child: TextField(
                        controller: _valorConvertir,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Cantidad a convertir',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0), // Espaciado

                //Boton para realizar la conversión de monedas
                ElevatedButton(
                  onPressed: _convertCurrency,
                  child: const Text('Convertir'),
                ),
                const SizedBox(height: 40.0), // Espaciado

                Row(
                  // Fila para mostrar el resultado de la conversión
                  children: [
                    Expanded(
                      // Dropdown para seleccionar la moneda de destino
                      child: DropdownButton<String>(
                        value: _convertirA,
                        items: _TasasCambio.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _convertirA = newValue!;
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 16.0), //Espaciado

                    // Mostrar el resultado de la conversión
                    Text(
                      '${_ajustarDecimales(_valorConvertido)} $_convertirA',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
