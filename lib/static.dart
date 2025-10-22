import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuidMed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 183, 58, 166),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CuidMed - Login'),
    );
  }
}
