import 'package:flutter/material.dart';
import 'avatar_screen.dart'; // Importando o arquivo AvatarScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AvatarScreen(), // Definindo AvatarScreen como a tela inicial
    );
  }
}
