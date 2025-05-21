import 'package:flutter/material.dart';

class ErrorHome extends StatelessWidget {
  const ErrorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("Error, compruebe su conexion a internet")
          ],
        ),
      ),
    );
  }
}