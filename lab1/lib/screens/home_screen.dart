import 'package:flutter/material.dart';
import 'package:lab1/screens/currency_conv_screen.dart';
import 'package:lab1/screens/free_screen.dart';
import 'package:lab1/screens/grades_screen.dart';
import 'package:lab1/screens/resistor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Genre {male, female}

class _HomeScreenState extends State<HomeScreen> {

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
        title: const Text(
          'Lab 1',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Broadway',
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: <Widget>[
         const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(  // Center the title text
              child: Text(
                'Elija una de las funciones',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Creates a grid layout with 2 columns and 2 rows
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[

              // Image 1
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CurrencyConv()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/currency.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Conversor de divisas'),
                    ),
                  ],
                ),
              ),
              
              // Image 2
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalculatorScreen()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/calculator.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Calculadora'),
                    ),
                  ],
                ),
              ),

              // Image 3
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GradesScreen()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/grades.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Calculadora de nota final'),
                    ),
                  ],
                ),
              ),
              
              // Image 4
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResistorScreen()),
                  );
                },
                child: const Column(
                  children: [
                    Expanded(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage('assets/images/resistor.png')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Calculadora de resistencias'),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}