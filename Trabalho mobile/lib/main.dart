import 'package:flutter/material.dart';
import 'tela_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Interativo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaPrincipal(), // Tela inicial do aplicativo
    );
  }
}
