import 'package:app_justificacion/pages/home_page.dart';
import 'package:app_justificacion/pages/login_page.dart';
import 'package:app_justificacion/pages/registro_page.dart';
import 'package:app_justificacion/widgets/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context) => RegistroPage(),
        'lista': (BuildContext context) => ListaPage(),
      },
    );
  }
}
