import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart'; // Importa a tela inicial (login)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuidMed', // Nome do aplicativo
      theme: ThemeData(
        // Define o tema principal do app
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 183, 58, 166), // Cor base do tema
        ),
        useMaterial3: true, // Usa o estilo Material 3 (mais moderno)
      ),
      home: const MyHomePage(title: 'CuidMed - Login'), // Define a primeira tela exibida
    );
  }
}
