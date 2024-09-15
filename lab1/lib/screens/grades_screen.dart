import 'package:flutter/material.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  // Controladores para los campos de texto
  final TextEditingController _controladorLaboratorio = TextEditingController();
  final TextEditingController _controladorPrimerAvance = TextEditingController();
  final TextEditingController _controladorSegundoAvance = TextEditingController();
  final TextEditingController _controladorProyectoFinal = TextEditingController();

  // Variable para almacenar el resultado del cálculo
  double _notaFinal = 0.0;
  String _mensaje = '';

  // Función para validar si una nota está en el rango permitido
  bool _esNotaValida(double nota) {
    return nota >= 0.0 && nota <= 5.0;
  }

  // Función para calcular la nota final
  void _calcularNotaFinal() {
    // Obtener los valores ingresados
    double notaLaboratorio = double.tryParse(_controladorLaboratorio.text) ?? -1.0;
    double notaPrimerAvance = double.tryParse(_controladorPrimerAvance.text) ?? -1.0;
    double notaSegundoAvance = double.tryParse(_controladorSegundoAvance.text) ?? -1.0;
    double notaProyectoFinal = double.tryParse(_controladorProyectoFinal.text) ?? -1.0;

    // Verificar si todas las notas están en el rango de 0.0 a 5.0
    if (_esNotaValida(notaLaboratorio) &&
        _esNotaValida(notaPrimerAvance) &&
        _esNotaValida(notaSegundoAvance) &&
        _esNotaValida(notaProyectoFinal)) {
      setState(() {
        // Calcular la nota final con los porcentajes correspondientes
        _notaFinal = (notaLaboratorio * 0.6) +
            (notaPrimerAvance * 0.1) +
            (notaSegundoAvance * 0.1) +
            (notaProyectoFinal * 0.2);
        _mensaje = 'Tu nota definitiva es: ${_notaFinal.toStringAsFixed(2)}';
      });
    } else {
      // Mostrar mensaje de error si alguna nota no está en el rango
      setState(() {
        _mensaje = 'Por favor, ingresa notas válidas entre 0.0 y 5.0';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 254, 173, 0), // Color de la Barra
        title: const Text(
          'Promedio final',
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mediante esta interfaz podrás calcular tu nota de una manera fácil y rápida, así podrás saber exactamente qué nota definitiva obtendrás para el curso de "Programación para Dispositivos móviles".',
                  style: TextStyle(fontSize: 18.0, letterSpacing: 0.5),
                  textAlign: TextAlign.justify,
                ),

                const SizedBox(height: 16.0),
                const Text('Ingresa tus notas actuales correspondientes a cada actividad:',
                    style: TextStyle(fontSize: 18.0, letterSpacing: 0.5),
                    textAlign: TextAlign.justify),
                const SizedBox(height: 16.0),
                // Campo para la nota de practicas de laboratorio
                TextField(
                  controller: _controladorLaboratorio,
                  decoration: const InputDecoration(
                    labelText: 'Prácticas de laboratorio (60%)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                // Campo para el primer avance del proyecto
                TextField(
                  controller: _controladorPrimerAvance,
                  decoration: const InputDecoration(
                    labelText: 'Primer avance del proyecto (10%)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                // Campo para el segundo avance del proyecto
                TextField(
                  controller: _controladorSegundoAvance,
                  decoration: const InputDecoration(
                    labelText: 'Segundo avance del proyecto (10%)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                // Campo para la entrega final del proyecto
                TextField(
                  controller: _controladorProyectoFinal,
                  decoration: const InputDecoration(
                    labelText: 'Entrega proyecto final (20%)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24.0),
                // Botón para calcular la nota final
                ElevatedButton(
                  onPressed: _calcularNotaFinal,
                  child: const Text(
                    'Calcular nota definitiva',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 24.0),
                // Mostrar el mensaje de resultado o error
                Text(
                  _mensaje,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}