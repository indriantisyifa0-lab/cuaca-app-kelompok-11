import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CuacaApp());
}

class CuacaApp extends StatelessWidget {
  const CuacaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuaca Hari Ini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorSchemeSeed: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
