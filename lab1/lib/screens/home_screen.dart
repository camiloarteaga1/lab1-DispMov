import 'package:flutter/material.dart';

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
        title: Text('Lab 1'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Creates a grid layout with 2 columns
        padding: const EdgeInsets.all(8.0),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: <Widget>[
          // Image 1
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradesScreen()),
              );
            },
            child: Image.network(
              'https://via.placeholder.com/150', // Replace with your image URL or asset
              fit: BoxFit.cover,
            ),
          ),
          // Image 2
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => CurrencyScreen()),
          //     );
          //   },
          //   child: Image.network(
          //     'https://via.placeholder.com/150', // Replace with your image URL or asset
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // // Image 3
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ResisrtorScreen()),
          //     );
          //   },
          //   child: Image.network(
          //     'https://via.placeholder.com/150', // Replace with your image URL or asset
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // // Image 4
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => FreeScreen()),
          //     );
          //   },
          //   child: Image.network(
          //     'https://via.placeholder.com/150', // Replace with your image URL or asset
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }