import 'package:flutter/material.dart';
import 'dart:async'; // Importa el paquete para utilizar Future y Timer
import 'secondscreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _showErrorMessage = false; // Controla la visibilidad del mensaje

  void _login() {
    String user = _userController.text;
    String password = _passwordController.text;

    if (user == 'admin' && password == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(user: user),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Usuario no autenticado';
        _showErrorMessage = true; // Muestra el mensaje de error
      });

      // Oculta el mensaje de error después de 3 segundos
      Timer(Duration(seconds: 3), () {
        setState(() {
          _showErrorMessage = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Ingresar'),
                onPressed: _login,
              ),
              SizedBox(height: 20),
              _showErrorMessage
                  ? Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox(), // Mostrar solo si _showErrorMessage es true
            ],
          ),
        ),
      ),
    );
  }
}
