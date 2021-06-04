import 'package:flutter/material.dart';
import 'package:prueba/prueba_alex.dart';
import 'package:prueba/test_responsive_agencias.dart';
import 'package:prueba/viajero_expreso_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.amber,
      ),
      home: ViajeroExpressoApp(),
    );
  }
}
