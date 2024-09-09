import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Genre {male, female}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  Genre? _genre = Genre.male;

  late DateTime _birthday = DateTime.now();

  String _dateConverter(DateTime birthday){
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String dateFormatted = formatter.format(_birthday);
    return dateFormatted;
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
          child: Image(
            image: AssetImage('assets/icons/logo.png'),
          ),
        ),
        backgroundColor: const Color.fromARGB(170, 29, 112, 108),
        title: const Text('My Movies'),
        ),
        
      body: Container(padding: const EdgeInsets.only(left: 28, right: 28, bottom: 100.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color.fromARGB(150, 0, 0, 0), BlendMode.darken),
          ),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                height: 200,
                width: 200,
                image: AssetImage('assets/icons/popcorn.png')
                ),

              const SizedBox(height: 40),
              TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    // borderColor: Colors.white,
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.black),
                    helperText: 'Mandatory',
                    helperStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                ),

              const SizedBox(height: 25),
              TextFormField(
                  controller: _mailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    helperText: 'Mandatory',
                    helperStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

              const SizedBox(height: 10),
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    helperText: 'Mandatory',
                    helperStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordObscured ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                    ),
                  ),
                  obscureText: _isPasswordObscured,
                  keyboardType: TextInputType.visiblePassword,
                ),

              const SizedBox(height: 10),
              TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    helperText: 'Mandatory',
                    helperStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isConfirmPasswordObscured ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                        });
                      },
                    ),
                  ),
                  obscureText: _isConfirmPasswordObscured,
                  keyboardType: TextInputType.visiblePassword,
                ),

              const SizedBox(height: 10),
              Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Masculine'),
                        titleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        leading: Radio<Genre>(       
                          fillColor: const WidgetStatePropertyAll(Colors.white), 
                          value: Genre.male,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Femenine'),
                        titleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        leading: Radio<Genre>(
                          fillColor: const WidgetStatePropertyAll(Colors.white),
                          value: Genre.female,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}