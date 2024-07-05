import 'package:flutter/material.dart';
import 'secondscreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Definimos dos números a sumar antes del scaffold
    int num1 = 10;
    int num2 = 15000;
    int suma = num1 + num2; // Calculamos la suma

    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a la Segunda Pantalla'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(suma: suma),
              ),
            );
          },
        ),
      ),
    );
  }
}
