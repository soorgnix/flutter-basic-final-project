import 'package:flutter/material.dart';
import 'package:tugasakhir_pemula/menu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoranku',
      theme: ThemeData(),
      home: const MenuScreen()
    );
  }
}
